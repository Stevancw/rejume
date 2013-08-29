require 'spec_helper'

feature 'Authentication' do

  context "Given I am on the homepage and not logged in" do
    scenario "there should be a link to the login form" do
      visit root_path
      click_on 'Login'

      expect(current_path).to eq login_path
    end

    scenario "there should be no link to logout" do
      visit root_path
      expect(page).to_not have_link 'Logout'
    end
  end

  context "Given I am a registered user" do

    before(:each) do
      @user = create(:user)
    end

    scenario "I should be able to login" do
      login_user(@user)

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Logged in!'
    end

    scenario "I am logged in so I should be able to logout" do
      login_user(@user)
      click_on 'Logout'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Logged out!'
    end
  end

  private

    def login_user(user)
      visit new_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

end