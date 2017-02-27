class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_by_state = Event.where :location_state => current_user.location_state
    puts 'location_state query:', @events_by_state
    @user = current_user
    @event = Event.new
  end

  def new

  end

  def create
    @event = Event.new( event_params )
    if @event.save
      redirect_to events_path
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to events_path
    end
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
