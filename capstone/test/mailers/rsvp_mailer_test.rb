require 'test_helper'

class RsvpMailerTest < ActionMailer::TestCase
  test "guest_invite" do
    mail = RsvpMailer.guest_invite
    assert_equal "Guest invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
