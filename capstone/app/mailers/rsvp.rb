class Rsvp < ActionMailer::Base
  default from: "support@example.com"
  layout 'mailer'

  def rsvp_guest(user, guest)
    @user = user
    @guest = guest

    mail to: @guest.email, subject: "Wanna Come To My Wedding #{@guest.name}?"

    mail(from: @user.email, to: @guest.email, subject: 'Wanna Come To My Wedding?')
  end
end
