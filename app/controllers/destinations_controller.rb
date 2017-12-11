class DestinationsController < ApplicationController

  def index
    reviews_count = params[:reviews_count]
    binding.pry
    @destinations = Destination.find(reviews_count)
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "Your destination has successfully been updated!"
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!
      render status: 200, json: {
        message: "Your destination has been destroyed, just like your mom last night!"
      }
    end
  end

  private

  def destination_params
    params.permit(:country, :city)
  end
end
