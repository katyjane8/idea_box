require 'rails_helper'

describe "user actions" do
  scenario 'user sees link to create account' do
    visit '/'

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[username]", with: "funbucket13"
    fill_in "user[password]", with: "test"

    click_on "Create User"

    # save_and_open_page
    expect(page).to have_content("Welcome, funbucket13!")
  end
end
