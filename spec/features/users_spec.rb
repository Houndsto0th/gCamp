require 'rails_helper'
feature "Users" do
  scenario "Users create new (vaild) user" do
    visit root_path
    click_on "users"
    click_on "Create User"
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Testington"
    fill_in "Email", with: "Testington@example.com"
    fill_in "Password", with: "test"
    fill_in "Password confirmation", with: "test"
    click_on "Create User"
    expect(page).to have_content("User Saved: Success!")
  end

  scenario "Users create blank user" do
    visit root_path
    click_on "users"
    click_on "Create User"
    click_on "Create User"
    expect(page).to have_content("can't be blank")
  end

  scenario "Users edit user" do
    User.create!(
    first_name: "Test",
    last_name: "Testington",
    email: "Testington@example.com",
    password: "pass",
    password_confirmation: "pass",
    )

    visit root_path
    click_on "users"
    expect(page).to have_content("Testington")
    click_on "Edit"
    fill_in "First name", with: "Random"
    click_on "Update User"
    expect(page).to have_content("Random")
  end

  scenario "Users edit user with invalid email" do
    User.create!(
    first_name: "Test",
    last_name: "Testington",
    email: "Testington@example.com",
    password: "pass",
    password_confirmation: "pass",
    )

    visit root_path
    click_on "users"
    expect(page).to have_content("Testington")
    click_on "Edit"
    fill_in "Email", with: "Random"
    click_on "Update User"
    expect(page).to have_content("Email is invalid")
  end

  scenario "Users edit user with invalid email" do
    User.create!(
    first_name: "Test",
    last_name: "Testington",
    email: "Testington@example.com",
    password: "pass",
    password_confirmation: "pass",
    )

    visit root_path
    click_on "users"
    expect(page).to have_content("Testington")
    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_content("User Deletion: Success!")
  end

end
