require 'rails_helper'

RSpec.feature "BookingWorkflows", type: :feature do
  context 'create new user' do 
    before(:each) do
      @user1 = FactoryBot.create(:user)
      login_as(@user1, :scope => :user)
      @booking1 = FactoryBot.create(:booking)
    end

    scenario "should be successful" do
      visit '/hospitals'
      expect(page).to have_content 'Logout'
    end
    
    context 'creation of new booking' do
      scenario "new booking can be visited" do 
        visit new_hospital_booking_path(@booking1.hospital.id)
        expect(page).to have_content @booking1.hospital.name
        expect(page).to have_content @booking1.hospital.slots
      end
    
      scenario "should fail if entered non-valid date" do
        visit new_hospital_booking_path(@booking1.hospital.id)
        fill_in 'booking_date', with: Date.yesterday
        click_button 'Create Booking'
        expect(page).to have_content "Date can\'t be in the past"
      end
      
      scenario "should pass if entered valid date" do
        visit new_hospital_booking_path(@booking1.hospital.id)
        fill_in 'booking_date', with: Date.tomorrow
        click_button 'Create Booking'
        expect(page).to have_content 'booking created please check you email.'
        expect(page).to have_content @booking1.hospital.name
        expect(page).to have_content @booking1.hospital.address
      end
    end

    context 'updating booking' do
      scenario 'should pass with valid booking' do
        visit edit_booking_path(@booking1.id) 
        fill_in 'booking_date', with: Date.tomorrow
        click_button 'Update Booking'
        expect(page).to have_content 'booking updated successfully.'
      end 
    end

    context 'deleting booking' do
      scenario 'should delete valid booking' do
        visit booking_path(@booking1.id)
        click_link 'Cancel Booking'
        expect(page).to have_content 'booking deleted successfully.'
      end
    end

    
  end
end