Task.delete_all
User.delete_all
100.times do
  Task.create description: Faker::Lorem.sentence,
              due_date: Faker::Time.forward(24),
              complete: [true, true, false].sample
end
