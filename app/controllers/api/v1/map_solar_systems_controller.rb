module Api
  module V1
    class MapSolarSystemsController < ApplicationController
      respond_to :json

      def index
        if params[:solarSystemID].present?
          ids = params[:solarSystemID]
          ids = ids.split(',').map &:to_i
          render json: MapSolarSystem.where(solarSystemID: ids).as_json()
        else
          render json: MapSolarSystem.all
        end
      end

    end
  end
end