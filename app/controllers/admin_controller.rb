class AdminController < ApplicationController


  def new
    if logged_in? && session[:user_id] == 1
      @critics = Critic.all
    else
      redirect_to movies_path
    end
  end

  
end
