class ApplicationController < ActionController::Base
  before_action :require_login, except: [:new,:create]

  private

  def require_login
    unless session[:user_id]
      puts "User isn't logged in..."
      flash[:alert] = "You must be logged in to access this page"
      redirect_to "/" # halts request cycle
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  protect_from_forgery with: :exception
end