class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    if current_user
      @movie = Movie.find(params[:id])
      @review = Review.new
      @critic = Critic.find(session[:user_id])
      @review.critic_id = @critic.id
    else
      redirect_to "/login"
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      redirect_to new_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:critic_id, :movie_id, :content, :star_rating)
  end

end
