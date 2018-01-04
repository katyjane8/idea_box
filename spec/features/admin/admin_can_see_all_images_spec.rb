require 'rails_helper'

describe "When I visit admin images index" do
  describe "as an admin" do
    scenario "I see all images" do
      image1 = create(:image)
      admin = User.create!(username: "admin", password: "admin", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_link("Create Image")
      expect(page).to have_content(image1.name)
    end
  end
end
