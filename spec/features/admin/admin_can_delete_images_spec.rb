require 'rails_helper'

describe "Admin deletes existing image" do
  it "an admin can delete a image" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_images_path
    attach_file('image', File.join(Rails.root, '/spec/fixtures/2.jpg'))
    click_link "Create Image"

    visit admin_images_path

    click_link "delete"

    expect(page).to have_content("Image Index")
    expect(page).to_not have_content("1.jpg")
  end
end
