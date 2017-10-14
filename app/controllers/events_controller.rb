class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.hosted_events.new
  end

  def create
    @event = current_user.hosted_events.new(event_params)
    if @event.save
      flash[:success] = "Your event has been created."
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:title, :location, :date, :time, :description)
    end

    def logged_in_user
      unless logged_in?
        flash[:info] = "You must be logged in to do that."
        redirect_to login_path
      end
    end
end
