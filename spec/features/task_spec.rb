require 'rails_helper'

feature "Tasks" do

  scenario "User creates a new task" do

    visit root_path
    click_on "tasks"
    expect(page).to have_content("Tasks")
    click_on "New Task"
    fill_in "Description", with: "Testing this description... w00t!"
    click_on "Create Task"
    expect(page).to have_content("Testing this description... w00t!")

  end

  scenario "User edits views a task" do
    Task.create!(
    description: "Testing this description... w00t!"
    )

    visit root_path
    click_on "tasks"
    expect(page).to have_content("Testing this description... w00t!")
    click_on "Edit"
    fill_in "Description", with: "Testing a different description... still w00t!"
    check "Complete"
    click_on "Update Task"
    expect(page).to have_content("Testing a different description... still w00t!")
  end

  scenario "User Deletes a task" do
    Task.create!(
    description: "Testing this description... w00t!",
    complete: true
    )

    visit root_path
    click_on "tasks"
    click_on "All Tasks"
    expect(page).to have_content("Testing this description... w00t!")
    click_on "Destroy"
    expect(page).to have_content("Task was successfully destroyed.")
  end

  scenario "User views a task" do
    Task.create!(
    description: "Testing this description... w00t!",
    complete: true
    )

    visit root_path
    click_on "tasks"
    click_on "All Tasks"
    expect(page).to have_content("Testing this description... w00t!")
    click_on "Show"
    expect(page).to have_content("Testing this description... w00t!")
    click_on "Back"
  end

end
