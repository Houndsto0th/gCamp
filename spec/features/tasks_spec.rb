require 'rails_helper'

feature "Tasks" do

  scenario "User creates a new task" do
    project = create_project

    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    expect(page).to have_content("0 Tasks")
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: Faker::Lorem.sentence
    fill_in "Due date", with: Faker::Time.forward(24)
    click_on "Create Task"
    expect(page).to have_content("successfully created")

  end

  scenario "User tries to create a task with no description and date in the past" do
    project = create_project

    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    expect(page).to have_content("0 Tasks")
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Due date", with: Faker::Time.backward(365)
    click_on "Create Task"
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("on or after")

  end



  scenario "User edits a task" do
    project = create_project
    task = create_task(project: project)


    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    expect(page).to have_content("1 Task")
    click_on "1 Task"
    expect(page).to have_content(task.description)
    click_on task.description
    click_on "Edit"
    fill_in "Description", with: Faker::Lorem.sentence
    click_on "Update Task"
    expect(page).to have_content(task.reload.description)

  end


  scenario "User Deletes a task" do
    project = create_project
    task = create_task(project: project)

    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    expect(page).to have_content("1 Task")
    click_on "1 Task"
    expect(page).to have_content(task.description)

  end


end
