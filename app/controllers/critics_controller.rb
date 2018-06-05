class CriticsController < ApplicationController
  def index
    @critics = Critic.all
  end

  def show
    @critic = Critic.find(params[:id])
  end

  def new
    @critic = Critic.new
  end

  def create
    @critic = Critic.new(critic_params)
    if @critic.save
      session[:user_id] = @critic.id
      redirect_to critic_path(@critic)
    else
      redirect_to "/signup"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def critic_params
    params.require(:critic).permit(:name, :email, :password, :password_confirmation)
  end

end
