require 'rails_helper'

feature 'Comments' do

  before do
    User.delete_all
    Project.delete_all
    Task.delete_all
  end

  scenario "Visitor can\'t view comments" do
    project = create_project
    task = create_task(project: project)
    visit project_task_comments_path(project, task)
    expect(page).to have_content("You must be logged in")

  end

  scenario "Logged in User creates a comment" do
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
    

  end
end
