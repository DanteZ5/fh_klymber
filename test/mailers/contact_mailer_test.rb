require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "welome" do
    mail = ContactMailer.welome
    assert_equal "Welome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reconfirmation" do
    mail = ContactMailer.reconfirmation
    assert_equal "Reconfirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
