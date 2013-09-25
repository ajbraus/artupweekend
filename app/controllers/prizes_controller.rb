class PrizesController < ApplicationController
  before_filter :authenticate_user!

  def create
    Prize.create(params[:prize])
    @event = Event.find(params[:prize][:event_id])

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @prize = Prize.find(params[:id])
    @event = @prize.event
    @prize.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end