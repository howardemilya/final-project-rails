class SessionsController < ApplicationController

  def new
    @critic = Critic.new
  end

  def create
    @critic = Critic.find_by(name: params[:critic][:name]) || Critic.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @critic.id
    redirect_to critic_path(@critic)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
