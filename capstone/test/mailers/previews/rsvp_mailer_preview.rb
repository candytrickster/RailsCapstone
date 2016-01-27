# Preview all emails at http://localhost:3000/rails/mailers/rsvp_mailer
class RsvpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rsvp_mailer/guest_invite
  def guest_invite

    @guest = GuestList.find(19)

    RsvpMailer.guest_invite(@guest)
  end

end
