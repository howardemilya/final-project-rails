class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    if current_user
      @movie = Movie.find(params[:movie_id])
      @critic = Critic.find(session[:user_id])
      @review = Review.new(movie_id: params[:movie_id], critic_id: @critic.id)
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

  def show
    @review = Review.find(params[:id])
  end

  def edit
    if current_user && session[:user_id] == Review.find(params[:id]).critic_id
      @review = Review.find(params[:id])
      @movie = Movie.find(@review.movie_id)
    else
      @review = Review.find(params[:id])
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.save
    redirect_to review_path(@review)
  end



  private

  def review_params
    params.require(:review).permit(:critic_id, :movie_id, :content, :star_rating)
  end

end
