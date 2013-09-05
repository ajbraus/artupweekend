class VolunteersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:volunteer][:event_id])
    current_user.volunteer!(@event, params[:leader])
    
    respond_to do |format|
      format.html { redirect_to @event }
      format.js { render template: "rsvps/in" }
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @event = @volunteer.event
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end