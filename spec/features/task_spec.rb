require 'rails_helper'

feature "Tasks" do

  before :each do
    project = Project.create!(proj_name: "#{Faker::Hacker.ingverb.humanize} #{Faker::Hacker.noun.humanize}")
      task = Task.create!(description: Faker::Lorem.sentence,
        due_date: Faker::Time.forward(24),
        complete: [true, true, false].sample,
        project_id: project.id,)

      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password,)
      Membership.create!(
        role: "Member",
        project_id: project.id,
        user_id: user.id,)
  end




  scenario "User creates a new task" do



    visit root_path
    click_on "projects"
    expect(page).to have_content(project.proj_name)


  end

  scenario "User edits views a task" do

  end

  scenario "User Deletes a task" do

  end

  scenario "User views a task" do

  end

end
