class Api::V1::LocationsController < ApplicationController

    def index
        @locations = Location.all
        render json: @locations
    end

    def show
        @location = Location.find(params[:id])
        render json: @location
    end

    def create
        # p params
        @location = Location.new(location_params)
        p @location
        if @location.save
            render json: @location
        else
            render json: {error: 'Error - Unable to create location.'}, status: 400
        end
    end

    def update
    end

    def destroy
    end

    
    private

    def location_params
        params.require(:location).permit(:user_id, :name, :places_id, :lat, :lng, :category, :description )
    end


end #End of Users Controller
