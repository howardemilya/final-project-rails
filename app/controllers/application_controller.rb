class ApplicationController < ActionController::Base

  def logged_in?
    !!current_user
  end

  private

    def require_logged_in
      redirect_to "/login" unless logged_in?
    end

    def current_user
      @current_user ||= Critic.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user 
end
