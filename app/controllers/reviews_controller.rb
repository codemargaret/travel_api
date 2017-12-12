class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  
  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Your review has successfully been updated!"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: "Your review has been destroyed, just like your mom last night!"
      }
    end
  end

  private

  def review_params
    params.permit(:content, :rating, :user_id, :destination_id)
  end
end
