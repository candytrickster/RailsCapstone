class Rsvp < ActionMailer::Base
  default from: "from@example.com"

  def rsvp_guest(user, guest)
    @user = user
    @guest = guest
    mail(from: @user.email, to: @guest.email, subject: 'Wanna Come To My Wedding?')
  end
end
