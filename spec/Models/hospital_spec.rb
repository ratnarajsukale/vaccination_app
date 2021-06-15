require 'rails_helper'

RSpec.describe Hospital, type: :model do
  subject(:hospital1) { FactoryBot.create(:hospital) }

  context "has valid factory" do
  	it "can be created" do
  		expect(subject).to be_valid
  	end
  end 

  context "check validations" do
    it "cannot be created without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "cannot be created without address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it { expect(subject).to validate_numericality_of(:slots) }
  end

  context "ActiveRecord Associations" do
    it { expect(subject).to have_many(:bookings) }
  end

  context "ckecks for custom methods" do
    it "reduces slot by one" do
      expect { subject.subtract_one_slot }.to change { subject.slots }.by(-1)
    end 

    it "increases slot by one" do
      expect { subject.add_one_slot }.to change { subject.slots }.by(1)
    end
  end
end