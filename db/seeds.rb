Project.delete_all
Task.delete_all
User.delete_all
Membership.delete_all

User.create!(
    first_name: "Hounds",
    last_name: "Toothington",
    email: "hounds@example.com",
    password: "password",
    admin: true,
)

User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "admin@example.com",
    password: "password",
    admin: true,
)

25.times do
  project = Project.create!(proj_name: "#{Faker::Hacker.ingverb.humanize} #{Faker::Hacker.noun.humanize}")
    rand(10).times do
      task = Task.create!(description: Faker::Lorem.sentence,
                  due_date: Faker::Time.forward(24),
                  complete: [true, true, false].sample,
                  project_id: project.id)
                end


    rand(5).times do
      user = User.create!(
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      password_digest: Faker::Internet.password)
      Membership.create!(
                  role: ["Owner", "Member", "Member", "Member", "Member"].sample,
                  project_id: project.id,
                  user_id: user.id)
    end
end
