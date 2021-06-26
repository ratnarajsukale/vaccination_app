RSpec.describe AppointmentMailer, type: :mailer do
  describe 'appointment_scheduled' do
    let(:booking1) { FactoryBot.create(:booking) }
    let(:mail) { described_class.appointment_scheduled(booking1.user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Successfully Scheduled your Appointment ")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([booking1.user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['vaccination_App@example.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(booking1.user.name)
    end
  end
end