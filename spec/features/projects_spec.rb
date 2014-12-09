require 'rails_helper'
  feature 'Projects' do

    scenario 'Visitor cant view projects' do
      user = create_user
      project = create_project
      task = create_task(project: project)
      membership = create_membership(project: project, user: user)


      visit projects_path
      expect(page).to have_content("You must be logged in")
    end

    scenario 'User creates a new project' do
      user = create_user

      log_user_in(user: user)

      within (".dropdown") do
        click_on "New Project"
      end
      fill_in "Name", with: Faker::Lorem.sentence
      click_on "Create Project"
      expect(page).to have_content("Project Creation: Success!")
    end

    scenario 'User creates a project with a blank name' do
      user = create_user
      project = create_project
      task = create_task(project: project)
      membership = create_membership(project: project, user: user)

      log_user_in(user: user)

      within (".dropdown") do
        click_on "New Project"
      end
      click_on "Create Project"
      expect(page).to have_content("can't be blank")
    end

    scenario 'User edits a project' do
      user = create_user
      project = create_project
      task = create_task(project: project)
      membership = create_membership(project: project, user: user)

      log_user_in(user: user)

      within (".dropdown") do
        click_on project.proj_name
      end
      click_on "Edit"
      fill_in "Name", with: "Changed!"
      click_on "Update Project"
      expect(page).to have_content("Success!")
    end

    scenario 'User deletes a project' do
      user = create_user
      project = create_project
      task = create_task(project: project)
      membership = create_membership(project: project, user: user)

      log_user_in(user: user)

      within (".dropdown") do
        click_on project.proj_name
      end
      click_on "Delete"
    end


end
