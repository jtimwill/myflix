require 'spec_helper'

feature 'User signs in' do 
  scenario "with existing username" do 
    alice = Fabricate(:user)
    visit sign_in_path
    fill_in "Email Address", with: alice.email
    fill_in "Password", with: alice.password
    click_button "Sign in"
    expect(page).to have_content("You are signed in")
  end
end