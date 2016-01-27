# Preview all emails at http://localhost:3000/rails/mailers/rsvp
class RsvpPreview < ActionMailer::Preview

  def rsvp_guest
    user = User.last
    guest = GuestList.last
    Rsvp.rsvp_guest(user, guest)
  end

end
