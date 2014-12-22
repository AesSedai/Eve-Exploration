module Api
  module V1
    class MapRegionsController < ApplicationController
      respond_to :json

      def index
        if params[:regionID].present?
          render json: MapRegion.find(params[:regionID])
        else
          render json: MapRegion.all
        end
      end

    end
  end
end