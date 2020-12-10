require 'rails_helper'

describe "User", type: :feature do
    it "redirects to index when user sign up" do
        visit "/sign_up"
        fill_in 'user_username', with: 'karmaester'
        fill_in 'user_email', with: 'karma@siddharta.com'
        find("input[type='submit']").click
        expect(page).to have_content("Profile")
    end
    it "fails to create new user when param missing" do
        visit "/sign_up"
        fill_in 'user_username', with: 'karmaester'
        find("input[type='submit']").click
        expect(page).to have_content("Email")
    end
    it "fails to login when unexisting email passed" do
        visit "/login"
        fill_in 'email', with: 'ciencia@gmail.com'
        find("input[type='submit']").click
        expect(page).to have_content("401")
    end
end
