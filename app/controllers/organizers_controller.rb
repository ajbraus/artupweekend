class OrganizersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:organizer][:event_id])
    @organizer = User.find(params[:organizer][:organizer_id])
    @event.organizers << @organizer
    
    respond_to do |format|
      format.html { redirect_to @event }
      format.js { render template: "rsvps/in" }
    end
  end

  def destroy
    @organizer = Organizer.find(params[:id])
    @event = @organizer.event
    @organizer.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end