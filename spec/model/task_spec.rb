require 'rails_helper'

describe Task do
  before do
    Task.delete_all
    Project.delete_all
  end
  it "validates the date of a task" do
    project = create_project
    task = Task.new(
      description: Faker::Lorem.sentence,
      due_date: "12/12/2012",
      project_id: project.id,
    )


    task.valid?
    expect(task.errors[:due_date].present?).to eq(true)
    task.due_date = "12/12/3012"
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end

  include ActiveSupport::Testing::TimeHelpers
  it "confirms existing tasks can have a date in the past." do
    project = create_project
    task = Task.new
    travel_to Time.new("1/1/2010") do
      task.description= "Oh man, Time Travel"
      task.due_date= Date.today
      task.save
    end

    task.valid?
    p task.errors
    expect(task.errors[:due_date].present?).to eq(false)
    task.due_date = "1/1/2000"
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
    task.due_date = "1/1/3000"
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end
end
