require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject(:user1) { FactoryBot.create(:user) }

  context "has valid factory" do
  	it "can be created" do
  		expect(subject).to be_valid
  	end
  end 

  context "validations" do
    it "cannot be created without date" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

  end

  context "ActiveRecord Associations" do
    it { expect(subject).to have_one(:booking) }
  end

  context "custom user methods" do
    it "has already booked slot" do
      booking1 = FactoryBot.create(:booking, user_id: user1.id)
      already_booked = user1.already_booked_slot
      expect(already_booked).to be_truthy
    end 
  end 
end