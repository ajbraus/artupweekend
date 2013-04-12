class Notifier < ActionMailer::Base
  include UsersHelper
  include ActionView::Helpers::AssetTagHelper
  layout 'email' # use email.(html|text).erb as the layout for emails
  default from: "Artup Weekend team@artupweekend.org"

  def welcome(user)
    @user = user
    mail to: user.email, subject: "The Best Community of Artists - Artup Weekend"
    # rescue => ex
    # Airbrake.notify(ex)
  end
end
