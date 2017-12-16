require 'rails_helper'

describe "user actions" do
  scenario 'user sees link to create account' do
    visit '/'

    click_on "Sign Up to Be a User"

    expect(current_path).to eq(new_user_path)

    fill_in :username, with: "funbucket13"
    fill_in :password, with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, funbucket13!")
  end
end
