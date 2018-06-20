class SessionsController < ApplicationController

  def new
    @critic = Critic.new
  end

  def create
    if !!params[:critic]
      @critic = Critic.find_by(name: params[:critic][:name])
    else
      @critic = Critic.from_omniauth(request.env["omniauth.auth"])
    end
    session[:user_id] = @critic.id
    redirect_to critic_path(@critic)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
