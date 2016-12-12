require 'rails_helper'

describe "When a visitor tries to log in" do
  context "with valid credentials" do
    it "they can log in and log out" do
      visit '/'
      expect(current_path).to eq('/login')
      click_on "Sign in with GitHub"

      expect(current_path).to eq('/')
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Vote')
      expect(User.last.name).to eq("First Last")
      expect(page).to have_content('Log Out')

      within('.side-nav') do
        click_link("Log Out")
      end

      expect(current_path).to eq('/login')
      expect(page).to_not have_content('Log Out')
    end
  end
end
