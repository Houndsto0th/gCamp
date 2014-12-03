require 'rails_helper'


describe Task do
  it "validates the date of a task" do
    task = Task.new(
      due_date: Date.today-7
    )
    task.valid?
    expect(task.errors[:due_date].present?).to eq(true)
    task.due_date = Date.today
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end

  include ActiveSupport::Testing::TimeHelpers
  it "confirms existing tasks can have a date in the past." do
    task = Task.new
    travel_to 3.years.ago do
      task.description = "Oh man, Time Travel"
      task.due_date = Date.today
      task.save
    end

    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
    task.due_date = 1/1/2000
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
    task.due_date = 1/1/3000
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end
end
