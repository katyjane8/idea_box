require 'rails_helper'

describe "user actions" do
  scenario 'user sees link to create account' do
    visit '/'

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    # save_and_open_page
    fill_in :Username, with: "funbucket13"
    fill_in :Password, with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, funbucket13!")
  end
end
