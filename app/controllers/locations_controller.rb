class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: @locations, include: 'stations.connectors'
  end
end
