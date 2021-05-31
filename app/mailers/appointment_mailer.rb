class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_scheduled.subject
  #
  def appointment_scheduled(user)
    @greeting = "Hi"
    @user = user
    attachments['vaccine.png'] = File.read('app/assets/images/vaccine.png')
    mail( 
      to: @user.email,
      subject: "Successfully Scheduled your Appointment "
    )
  end
end
