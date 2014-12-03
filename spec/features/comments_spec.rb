require 'rails_helper'

feature 'Comments' do

  before do
    User.delete_all
    Project.delete_all
    Task.delete_all
  end

  scenario "Visitor can\'t create comments" do
    project = create_project
    task = create_task(project: project)

    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    click_on "1 Task"
    click_on task.description
    expect(page).to have_content("You must be logged in")

  end

  scenario "Logged in User creates a comment" do
    user = create_user
    project = create_project
    task = create_task(project: project)

    log_user_in(user: user)

    click_on "projects"
    expect(page).to have_content(project.proj_name)
    click_on project.proj_name
    click_on "1 Task"
    click_on task.description
    fill_in "comment_comment", with: "Testing"
    click_on "Add Comment"
    expect(page).to have_content("Comment saved")
  end
end
