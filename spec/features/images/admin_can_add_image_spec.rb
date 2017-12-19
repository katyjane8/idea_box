require 'rails_helper'

describe "When I visit new image page" do
  describe "as an admin" do
    scenario "I can create a new image" do
      admin = User.create!(username: "admin", password: "admin", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path

      fill_in "image[name]", with: "kangaroo"
      fill_in "image[url]", with: "https://pixabay.com/en/wallaby-rednecked-wallaby-australia-3007670/"

      click_on "Create Image"

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_content("kangaroo")
    end
  end

  xdescribe "as a default user" do
    scenario "I see a 404 error" do
      default_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit new_admin_image_path

      expect(status_code).to eq(404)
    end
  end
end
