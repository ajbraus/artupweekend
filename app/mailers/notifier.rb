class Notifier < ActionMailer::Base
  include ActionView::Helpers::AssetTagHelper
  layout 'email' # use email.(html|text).erb as the layout for emails
  default from: "Artup Weekend team@artupweekend.org"

  def welcome(user)
    @user = user
    mail to: user.email, subject: "Makers, Artists, & Entrepreneurs - UNITE!"
    # rescue => ex
    # Airbrake.notify(ex)
  end

  def event_application_received(user, application)
    @user = user
    @application = application
    mail to: user.email, subject: "We Recieved Your Application to Oraganize an Artup Weekend"
  end
end
