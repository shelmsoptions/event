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
      # puts session[:user_id]
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
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update( user_edit_params )
      redirect_to events_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/#{session[:user_id]}/edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :location_state, :password, :password_confirmation)
  end
  def user_edit_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :location_state)
  end
end