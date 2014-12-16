module Api
  module V1
    class MapConstellationsController < ApplicationController
      respond_to :json

      def index
        if params[:constellationID].present?
          render json: MapConstellation.find(params[:constellationID])
        end
      end

    end
  end
end