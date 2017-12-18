require 'rails_helper'

describe "user signs up for account" do
  context "they visit the root page" do
    context "they click on the registration link" do
      context "they fill in registration form" do
        it "a new user account is created" do
          visit '/'

          click_on "Sign Up"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: 'funbucket13'
          fill_in "user[password]",  with: 'testingtesting'

          click_on "Create User"
          # save_and_open_page
          expect(page).to have_content("Welcome, funbucket13!")
        end

        scenario "a registered user can log in" do
          user = User.create(username: "funbucket13", password: "test")

          visit '/'

          click_on "Log In"

          expect(current_path).to eq(login_path)
          fill_in "user[username]", with: user.username
          fill_in "user[password]", with: user.password

          click_on "Sign Me In"

          expect(current_path).to eq(user_path(user))

          expect(page).to have_content("Welcome, funbucket13!")
          expect(page).to have_content("Logout")
        end
      end
    end
  end
end
