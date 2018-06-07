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

  private

  def actor_params
    params.require(:actor).permit(:first_name, :last_name, :bio)
  end



end
