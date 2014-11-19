require 'rails_helper'
  feature 'Projects' do

    scenario 'User creates a new project' do
      visit root_path
      click_on 'projects'
      expect(page).to have_content("Projects")
      click_on 'New Project'
      fill_in "Name", with: "Testing out a project w00ty w00t!"
      click_on "Create Project"
      expect(page).to have_content("Testing out a project w00ty w00t!")
    end

    scenario 'User edits a project' do
      Project.create!(
      proj_name: "Testing a project?"
      )

      visit root_path
      click_on 'projects'
      expect(page).to have_content("Testing a project?")
      click_on 'Testing a project?'
      click_on 'Edit'
      fill_in "Name", with: "Testing a change to a project!"
      click_on "Update Project"
      expect(page).to have_content("Testing a change to a project!")

    end

    scenario 'User deletes a project' do
      Project.create!(
                      proj_name: "Testing a project deletion?")

      visit root_path
      click_on 'projects'
      expect(page).to have_content("Testing a project deletion?")
      click_on 'Testing a project deletion?'
      click_on 'Destroy'
      expect(page).to have_content("Project Deletion: Success!")
    end


end
