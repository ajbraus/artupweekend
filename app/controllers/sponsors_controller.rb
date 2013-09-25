class SponsorsController < ApplicationController
  before_filter :authenticate_user!

  def create
    Sponsor.create(params[:sponsor])
    @event = Event.find(params[:sponsor][:event_id])

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @event = @sponsor.event
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end