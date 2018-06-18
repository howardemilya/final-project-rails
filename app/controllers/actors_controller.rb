class ActorsController < ApplicationController

  def index
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    if current_user && current_user.admin
      @actor = Actor.new
    else
      redirect_to movies_path
    end
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to actor_path(@actor)
    else
      redirect_to new_actor_path
    end
  end

  def edit
    if current_user.admin
      @actor = Actor.find(params[:id])
    else
      redirect_to movies_path
    end
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.update(actor_params)
    @actor.save
    redirect_to actor_path(@actor)
  end

  private

  def actor_params
    params.require(:actor).permit(:first_name, :last_name, :bio, :movie_ids => [])
  end



end
