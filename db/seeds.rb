User.delete_all
Project.delete_all
Task.delete_all
Comment.delete_all
Membership.delete_all

admin = User.create!(
first_name: 'Admin',
last_name: 'User',
email: 'admin@example.com',
password: 'password',
admin: true
)

owner = User.create!(
first_name: 'Owner',
last_name: 'User',
email: 'owner@example.com',
password: 'password'
)

member = User.create!(
first_name: 'Member',
last_name: 'User',
email: 'member@example.com',
password: 'password'
)

user = User.create!(
first_name: 'Basic',
last_name: 'User',
email: 'user@example.com',
password: 'password'
)

multiple_owners = Project.create!(proj_name: 'Multiple Owners')
Membership.create!(
project: multiple_owners,
user: owner,
role: 'owner'
)
Membership.create!(
project: multiple_owners,
user: user,
role: 'owner'
)
Membership.create!(
project: multiple_owners,
user: member,
role: 'member'
)

task1 = Task.create!(
description: "Write 3 comments",
project: multiple_owners,
due_date: 4.days.from_now
)

task2 = Task.create!(
description: "Write 1 comment",
project: multiple_owners,
due_date: 5.days.from_now
)

3.times do
  Comment.create!(
  task: task1,
  user: owner,
  comment: Faker::Lorem.sentence
  )
end

Comment.create!(
task: task2,
user: member,
comment: Faker::Lorem.sentence
)

single_owner = Project.create!(proj_  name: 'Single Owner')
Membership.create!(
project: single_owner,
user: owner,
role: 'owner'
)
Membership.create!(
project: single_owner,
user: member,
role: 'member'
)
# My first complex seed file
# User.create!(
#     first_name: "Hounds",
#     last_name: "Toothington",
#     email: "hounds@example.com",
#     password: "password",
#     admin: true,
# )
#
# User.create!(
#     first_name: "Admin",
#     last_name: "User",
#     email: "admin@example.com",
#     password: "password",
#     admin: true,
# )
#
# 25.times do
#   project = Project.create!(proj_name: "#{Faker::Hacker.ingverb.humanize} #{Faker::Hacker.noun.humanize}")
#     rand(10).times do
#       task = Task.create!(description: Faker::Lorem.sentence,
#                   due_date: Faker::Time.forward(24),
#                   complete: [true, true, false].sample,
#                   project_id: project.id)
#                 end
#
#
#     rand(5).times do
#       user = User.create!(
#                       first_name: Faker::Name.first_name,
#                       last_name: Faker::Name.last_name,
#                       email: Faker::Internet.email,
#                       password_digest: Faker::Internet.password)
#       Membership.create!(
#                   role: ["Owner", "Member", "Member", "Member", "Member"].sample,
#                   project_id: project.id,
#                   user_id: user.id)
#     end
# end
