require 'rails_helper'

feature "Tasks" do

  scenario "Visitor cannot create tasks" do
    user = create_user
    project = create_project
    task = create_task(project: project)
    membership = create_membership(project: project, user: user)


    visit project_tasks_path(project)
    expect(page).to have_content("You must be logged in")
  end

  scenario "User creates a new task" do
    user = create_user
    project = create_project
    task = create_task(project: project)
    membership = create_membership(project: project, user: user)

    log_user_in(user: user)

    within (".dropdown") do
      click_on project.proj_name
    end

    expect(page).to have_content("1 Task")
    click_on "1 Task"
    click_on "New Task"
    fill_in "Description", with: Faker::Lorem.sentence
    fill_in "Due date", with: Faker::Time.forward(24)
    click_on "Create Task"
    expect(page).to have_content("successfully created")

  end

  scenario "User tries to create a task with no description and date in the past" do
    user = create_user
    project = create_project
    task = create_task(project: project)
    membership = create_membership(project: project, user: user)

    log_user_in(user: user)

    within (".dropdown") do
      click_on project.proj_name
    end

    expect(page).to have_content("1 Task")
    click_on "1 Task"
    click_on "New Task"
    fill_in "Due date", with: Faker::Time.backward(365)
    click_on "Create Task"
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("on or after")

  end



  scenario "User edits a task" do
    user = create_user
    project = create_project
    task = create_task(project: project)
    membership = create_membership(project: project, user: user)

    log_user_in(user: user)

    within (".dropdown") do
      click_on project.proj_name
    end

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
    user = create_user
    project = create_project
    task = create_task(project: project)
    membership = create_membership(project: project, user: user)

    log_user_in(user: user)

    within (".dropdown") do
      click_on project.proj_name
    end

    expect(page).to have_content("1 Task")
    click_on "1 Task"
    expect(page).to have_content(task.description)

  end


end
