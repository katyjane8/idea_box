require 'rails_helper'

describe "Admin deletes existing image" do
  it "an admin can delete a image" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path

    attach_file('Image', File.join(Rails.root, '/spec/fixtures/2.jpg'))

    click_on "Create Image"

    expect(page).to have_css('.image')

    click_on "delete"

    expect(page).to_not have_css('.image')
  end
end
