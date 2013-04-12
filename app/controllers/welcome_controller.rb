class WelcomeController < ApplicationController
  def index
  	@email_subscription = EmailSubscription.new
  	@subscription_counter = EmailSubscription.all.count
  	#@events = Event.all.order("starts_at DESC")
  end
end
