require 'rails_helper'

RSpec.describe Booking, :type => :model do

  subject(:booking1) do
    create(:booking)
  end 

  it "is valid with valid attributes" do
    expect(booking1).to be_valid
  end

  it "is not valid without a date" do
    booking1.date = nil
    expect(booking1).to_not be_valid 
  end

  it "is not valid in past date" do
    booking1.date = DateTime.now - 1.week
    expect(booking1).to_not be_valid
  end
end