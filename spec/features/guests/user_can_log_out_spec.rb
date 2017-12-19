require 'rails_helper'

describe "registered user wants to log out" do
  context "they navigate to show page" do
    context "they click logout link" do
      context "they are redirected back to root page" do
        it "logs user out" do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit "/users/#{user.id}"

          click_on "Logout"

          expect(page).to have_content("You've successfully logged out!")
          expect(current_path).to eq(login_path)
        end
      end
    end
  end
end
