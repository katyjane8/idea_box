require 'rails_helper'

describe "registered admin logs in" do
  context "they visit the root page" do
    context "they click login link" do
      context "they enter username and password" do
        context "their role is equal to 1"
          it "logs in admin" do
            admin = create(:admin)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

            visit admin_dashboard_index_path
            
            fill_in "username", with: admin.username
            fill_in "password", with: admin.password

            click_on "Log In"

            expect(page).to have_content("Welcome, #{admin.username}!")
            #expect page to be the admin dashboard
        end
      end
    end
  end
end
