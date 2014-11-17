Project.delete_all
Task.delete_all
User.delete_all
25.times do
  project = Project.create!(proj_name: Faker::Lorem.sentence)
    rand(10).times do
      Task.create!(description: Faker::Lorem.sentence,
                  due_date: Faker::Time.forward(24),
                  complete: [true, true, false].sample,
                  project_id: project.id)

    end
end
