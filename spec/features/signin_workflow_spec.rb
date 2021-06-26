require 'rails_helper'

RSpec.feature "SigninWorkflows", type: :feature do
  context 'create new user' do 
    before(:each) do
      visit '/users/sign_up'
      within("form") do
        fill_in 'user_name', with: 'john'
        fill_in 'user_age', with: '22'
        fill_in 'user_email', with: 'akash@example.com'
        fill_in 'user_password', with: '222222'
        fill_in 'user_password_confirmation', with: '222222'
      end
    end

    scenario "should be successful" do
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario "should not be successful with short password" do
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end
  end
end
