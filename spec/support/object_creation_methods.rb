
def create_project
    Project.create!(proj_name: "#{Faker::Hacker.ingverb.humanize} #{Faker::Hacker.noun.humanize}")
end

def create_task(options = {})
  project = options[:project] || create_project
  Task.create!(description: Faker::Lorem.sentence,
    due_date: Faker::Time.forward(24),
    complete: false,
    project_id: project.id,)
end

def create_user
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password,)
end

def create_membership
  project = create_project
  user = create_user
  Membership.create!(
    role: "Member",
    project_id: project.id,
    user_id: user.id,)
end
