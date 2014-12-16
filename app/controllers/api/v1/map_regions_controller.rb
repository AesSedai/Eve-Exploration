module Api
  module V1
    class MapRegionsController < ApplicationController
      respond_to :json

      def index
        if params[:regionID].present?
          render json: MapRegion.find(params[:regionID])
        end
      end

    end
  end
end