require "test_helper"

class AppointmentMailerTest < ActionMailer::TestCase
  test "appointment_scheduled" do
    mail = AppointmentMailer.appointment_scheduled
    assert_equal "Appointment scheduled", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
