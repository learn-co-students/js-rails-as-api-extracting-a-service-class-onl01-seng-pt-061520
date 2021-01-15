 class SightingsController < ApplicationController
    def index
        sighting = Sighting.all
        # without the serializer 
        render json: @sighting.to_json(:include => {
            :bird => {:only =>[:name, :species]}, 
            :location => {:only =>[:latitude, :longitude]}}, 
            :except => [:updated_at])
    end

    def show
        @sighting = Sighting.find(params[:id])
        # with the serializer
        render json: SightingSerializer.new(sighting_object).to_serialized_json
    end
end
