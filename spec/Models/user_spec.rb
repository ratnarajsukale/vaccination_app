require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user1) { FactoryBot.create(:user) }

  describe "has valid factory" do
    it "can be created" do
  	  expect(subject).to be_valid
  	end
  end 

  describe "validations" do
    it "cannot be created without date" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context "ActiveRecord Associations" do
    it { expect(subject).to have_one(:booking) }
  end

  describe "#user booked slot or not" do
    context "when user is found" do
      it "returns Truthy value" do
        booking1 = FactoryBot.create(:booking, user_id: user1.id)
        already_booked = user1.already_booked_slot
        expect(already_booked).to be_truthy
      end 
    end 

    context "when user is not found" do
      it "returns Falsy value" do
        already_booked = user1.already_booked_slot
        expect(already_booked).to_not be_truthy
      end 
    end 
  end 
end