require 'rails_helper'

describe "registered user logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        context "their role is equal to 1"
          it "logs in admin" do
            admin = create(:admin)
            visit "/"

            click_on "Log In"

            expect(current_path).to eq(login_path)

            fill_in "username", with: admin.username
            fill_in "password", with: admin.password

            click_on "Log In"

            expect(page).to have_content("Welcome, #{user.username}!")
            #expect page to be the admin dashboard
        end
      end
    end
  end
end
