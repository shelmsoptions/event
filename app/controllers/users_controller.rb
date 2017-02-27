class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
  end

  def create
    @user = User.new( user_params )
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      puts session[:user_id]
      redirect_to events_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :location, :location_state, :password, :password_confirmation)
  end
end