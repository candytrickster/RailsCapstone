class RsvpMailer < ActionMailer::Base
  default from: "support@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rsvp_mailer.guest_invite.subject
  #
  def guest_invite(guest)
    @user = User.find(guest.user_id)
    @guest = guest
    @url = "http://localhost:3000/invitation/#{@guest.id}"

    mail to: @guest.email, subject: "Wanna Come To My Wedding #{@guest.name}?"
  end
end
