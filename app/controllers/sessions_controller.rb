class SessionsController < ApplicationController
  # exclude index from require_login
  before_action :require_login, except: ['index', 'create']

  def new
  end

  def index
    @users = User.new
    # @session = Session.new
  end

  def create
    user = User.find_by_email(params[:email])
    # puts user.email
    if user && user.authenticate(params[:password])
      # puts "in create IF"
      session[:user_id] = user.id
      redirect_to events_path
    else
      flash[:errors] = ["Email/Password not found"]
      # puts "In create else"
      redirect_to "/"
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end
end
