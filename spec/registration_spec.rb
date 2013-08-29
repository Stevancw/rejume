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

  context "filling out the form with wrong credentials" do
    it "should not create a new user and re-render the new page" do
      visit root_path
      click_link 'Register'

      expect {
        click_button 'Register'
      }.to_not change(User, :count).by(1)

      expect(page).to have_content 'Please review the form'
    end
  end
end