require 'rails_helper'

RSpec.feature "BookingWorkflows", type: :feature do
  context 'create new user' do 
    before(:each) do
      @user1 = FactoryBot.create(:user)
      login_as(@user1, :scope => :user)
    end

    scenario "should be successful" do
      visit '/hospitals'
      expect(page).to have_content 'Logout'
    end

    

    
  end
end