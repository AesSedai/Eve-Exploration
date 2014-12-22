require 'net/http'
require 'crack'
require 'plissken'

module Api
  module V1
    class MapSolarSystemsController < ApplicationController
      respond_to :json

      def index
        if params[:solar_system_id].present?
          ids = params[:solar_system_id]
          ids = ids.split(',').map &:to_i
          render json: MapSolarSystem.joins(:map_constellation, :map_region).where(solar_system_id: ids).select('map_solar_system.solar_system_id', 'map_solar_system.solar_system_name', 'map_constellation.constellation_id', 'map_constellation.constellation_name', 'map_region.region_id', 'map_region.region_name')
        else
          most_recent_cache_time = MapJumpHistory.order('cached_until DESC').select('map_jump_history.cached_until').limit(1)

          cache_time = DateTime.now

          if most_recent_cache_time.count == 1
            cache_time = most_recent_cache_time[0]['cached_until']
          end

          if cache_time < DateTime.now

            batch, batch_size = [], 500
            url = 'https://api.eveonline.com/map/Jumps.xml.aspx'
            resp = Net::HTTP.get_response(URI.parse(url)) # get_response takes an URI object
            data = Crack::XML.parse(resp.body).to_snake_keys

            cache_time = (data['eveapi']['cached_until'].to_time - 6.hours).to_datetime

            data['eveapi']['result']['rowset']['row'].each do |system|
              batch << MapJumpHistory.new(:solar_system_id => system['solar_system_id'], :ship_jumps => system['ship_jumps'], :cached_until => cache_time)
              if batch.size > batch_size
                MapJumpHistory.import(batch)
                batch = []
              end
            end

            cached_systems = data['eveapi']['result']['rowset']['row'].map { |s| s['solar_system_id'] }

            no_jump_systems = MapSolarSystem.where('map_solar_system.solar_system_id NOT IN (?)', cached_systems)

            no_jump_systems.each do |system|
              batch << MapJumpHistory.new(:solar_system_id => system['solar_system_id'], :ship_jumps => 0, :cached_until => cache_time)
              if batch.size > batch_size
                MapJumpHistory.import(batch)
                batch = []
              end
            end
            MapJumpHistory.import(batch)
          end

          result = MapSolarSystem.joins(:map_constellation, :map_region, :map_jump_history).select('map_solar_system.solar_system_name', 'map_constellation.constellation_name', 'map_region.region_name', 'map_jump_history.ship_jumps').where('cached_until =?', cache_time).offset(params[:start]).limit(params[:length])

          data = []
          count = params[:start].to_i
          result.each do |system|
            data << {'DT_RowId' => 'row_'+count.to_s, 'DT_RowData' => {'pkey' => count}, 'rName' => system['region_name'], 'cName' => system['constellation_name'], 'sName' => system['solar_system_name'], 'sJumps' => system['ship_jumps']}
            count += 1
          end

          toRender = {
            'draw' => params[:draw],
            'recordsTotal' => MapSolarSystem.all.count,
            'recordsFiltered' => MapSolarSystem.all.count,
            'data' => data
          }

          render json: toRender
        end
      end
    end
  end
end