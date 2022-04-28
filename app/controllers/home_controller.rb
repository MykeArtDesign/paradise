class HomeController < ApplicationController
  def index
    @destinations = Destination.all
    render json: @destinations
  end
end
