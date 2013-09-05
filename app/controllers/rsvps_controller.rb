class RsvpsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:rsvp][:event_id])
    current_user.rsvp!(@event)
    
    respond_to do |format|
      format.html { redirect_to @event }
      format.js { render template: "rsvps/in" }
    end
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @event = @rsvp.event
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end