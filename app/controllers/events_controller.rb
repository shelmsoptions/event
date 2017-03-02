class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_by_state = Event.where :location_state => current_user.location_state
    @user = current_user
    @event = Event.new
    @join = Join.all
  end

  def new
  end

  def create
    @event = Event.new( event_params )
    flash[:errors] = @event.errors.full_messages unless @event.save
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update( event_params )
      redirect_to events_path
    else
      redirect_to "/events/#{params[:id]}/edit"
    end
  end

  def show
    @event = Event.find(params[:id])
    @users_joined = @event.users_joined
    @discussion = Discussion.new
    @discussions = Discussion.where(event:@event.id)
  end

  def destroy
    event = Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :location_state, :date, :user_id)
  end
end
