require 'spec_helper'

feature 'Authentication' do

  context "Given I am on the homepage" do
    scenario "there should be a link to the login form" do
      visit root_path
      click_on 'Login'

      expect(current_path).to eq login_path
    end
  end

end