class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = current_user.events.build
  end
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :other_attributes)
  end
end
