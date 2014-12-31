require 'net/http'
require 'crack'
require 'plissken'
require 'Logger'

module Api
  module V1
    class MapSolarSystemsController < ApplicationController

      respond_to :json

      def index

        l = Logger.new('log/test3.log')
        l.error("PARAMS: #{params.inspect}")

        if params[:solar_system_id].present?
          update_jumps
          ids = params[:solar_system_id]
          ids = ids.split(',').map &:to_i
          render json: MapSolarSystem.joins(:map_constellation, :map_region).where(solar_system_id: ids).select('map_solar_system.solar_system_id', 'map_solar_system.solar_system_name', 'map_constellation.constellation_id', 'map_constellation.constellation_name', 'map_region.region_id', 'map_region.region_name')
        elsif params.key?(:to_data_table)
          update_jumps
          order_column = params[:order]['0']['column']

          order_column_name = params[:columns][order_column]['data']
          order_column_dir = params[:order]['0']['dir']

          cache_time = get_cache_time
          result = MapSolarSystem.joins(:map_constellation, :map_region, :map_jump_cache).select('map_solar_system.solar_system_name', 'map_constellation.constellation_name', 'map_region.region_name', 'map_jump_cache.ship_jumps').where('cached_until =?', cache_time).offset(params[:start]).limit(params[:length]).order("#{order_column_name} #{order_column_dir}")

          data = []
          count = params[:start].to_i
          result.each do |system|
            data << {'DT_RowId' => 'row_'+count.to_s, 'DT_RowData' => {'pkey' => count}, 'region_name' => system['region_name'], 'constellation_name' => system['constellation_name'], 'solar_system_name' => system['solar_system_name'], 'ship_jumps' => system['ship_jumps']}
            count += 1
          end

          to_render = {
            'draw' => params[:draw],
            'recordsTotal' => MapSolarSystem.all.count,
            'recordsFiltered' => MapSolarSystem.all.count,
            'data' => data,
            'timer' => cache_time.to_time.to_i-DateTime.now.to_i
          }

          render json: to_render
        elsif params.key?(:time)
          render json: (get_cache_time.to_time.to_i-DateTime.now.to_i)
        else
          render nothing: true
        end

      end

      private

      def update_jumps
        cache_time = get_cache_time

        if cache_time < DateTime.now

          batch, batch_size = [], 500

          to_move = MapJumpCache.all
          MapJumpHistory.import(to_move.to_a)
          MapJumpCache.delete_all

          url = 'https://api.eveonline.com/map/Jumps.xml.aspx'
          resp = Net::HTTP.get_response(URI.parse(url)) # get_response takes an URI object
          data = Crack::XML.parse(resp.body).to_snake_keys

          cache_time = (data['eveapi']['cached_until'].to_time - 6.hours).to_datetime

          data['eveapi']['result']['rowset']['row'].each do |system|
            batch << MapJumpCache.new(:solar_system_id => system['solar_system_id'], :ship_jumps => system['ship_jumps'], :cached_until => cache_time)
            if batch.size > batch_size
              MapJumpCache.import(batch)
              batch = []
            end
          end

          cached_systems = data['eveapi']['result']['rowset']['row'].map { |s| s['solar_system_id'] }

          no_jump_systems = MapSolarSystem.where('map_solar_system.solar_system_id NOT IN (?)', cached_systems)

          no_jump_systems.each do |system|
            batch << MapJumpCache.new(:solar_system_id => system['solar_system_id'], :ship_jumps => 0, :cached_until => cache_time)
            if batch.size > batch_size
              MapJumpCache.import(batch)
              batch = []
            end
          end
          MapJumpCache.import(batch)
        end
      end

      def get_cache_time
        most_recent_cache_time = MapJumpCache.select('map_jump_cache.cached_until').limit(1)

        cache_time = DateTime.now

        if most_recent_cache_time.count == 1
          cache_time = most_recent_cache_time[0]['cached_until']
        end
        return cache_time
      end

    end
  end
end