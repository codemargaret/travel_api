class ReviewsController < ApplicationController

  def index
    @reviews = {"reviews": "This product sucks, just like your mom did last night!"}
    json_response(@reviews)
  end

  private

  def json_response(object)
    render json: object, status: :ok
  end

end
