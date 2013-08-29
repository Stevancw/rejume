require 'spec_helper'

feature "Registration" do
  context "filling out the form with all the require credentials" do
    it "should create a new user and redirect to the home page" do
      visit root_path
      click_on 'Register'

      expect(current_path).to eq signup_path

      expect {
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Register'
      }.to change(User, :count).by(1)

      expect(current_path).to eq root_path
      expect(page).to have_content 'Thank you for signing up!'
    end
  end

  context "Given I am a registerd user" do

    before(:each) do
      @user = create(:user)
    end

    scenario "I should be able to login" do
      login_user(@user)

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Logged in!'
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