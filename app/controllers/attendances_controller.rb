class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event])
    @event.attendees.delete(current_user)
    redirect_to @event
  end
end
