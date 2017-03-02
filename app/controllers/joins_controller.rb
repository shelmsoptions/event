class JoinsController < ApplicationController
  before_action :require_login

  def create
    join = Join.new( join_params )
    flash[:errors] = join.errors.full_messages unless join.save
    redirect_to events_path
  end

  def destroy
    join = Join.where( join_params )
    join_id = Join.find_by(user: current_user, event: (join_params[:event_id]))
    Join.find(join_id.id).destroy
    redirect_to events_path
  end

  private
  def join_params
    params.permit(:event_id, :user_id)
  end
end