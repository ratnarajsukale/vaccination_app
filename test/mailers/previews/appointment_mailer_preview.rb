# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/appointment_scheduled
  def appointment_scheduled
    AppointmentMailer.with(user: User.first).appointment_scheduled
  end

end
