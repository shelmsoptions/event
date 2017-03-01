class JoinsController < ApplicationController
  before_action :require_login

  def create
    join = Join.new( join_params )
    if join.save
      # puts "saved"
      redirect_to events_path
    else
      flash[:errors] = join.errors.full_messages
      # puts "not saved, brah"
      redirect_to events_path
    end
  end

  def destroy
    join = Join.where( join_params )
    join_id = Join.find_by(user: current_user, event: (join_params[:event_id]))
    # puts "Event ID: #{join_params[:event_id]}"
    # puts "User ID: #{join_params[:user_id]}"
    Join.find(join_id.id).destroy
    # puts "Join ID: #{Join.user_id}"
    redirect_to events_path
  end

  private
  def join_params
    params.permit(:event_id, :user_id)
  end
end