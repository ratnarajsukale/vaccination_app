require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking1) { FactoryBot.create(:booking) }

  context "has valid factory" do
    it "can be created" do
      expect(subject).to be_valid
    end
  end 

  context "validations" do
    it "cannot be created without date" do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it "date cannot be in past" do
      subject.date = Date.yesterday 
      expect(subject).to_not be_valid
    end
  end

  context "ActiveRecord Associations" do
    it { expect(subject).to belong_to(:hospital) }
    
    it { expect(subject).to belong_to(:user) }
  end
end

