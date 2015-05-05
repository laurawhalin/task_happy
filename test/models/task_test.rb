require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_uniqueness_of(:title).
  with_message("You already added that item to this list!")
  should validate_presence_of(:status)
  should belong_to(:list)

  test "it has a default status" do
    task = create(:task)
    assert_equal "incomplete", task.status
  end

  test "it has a default due date of tomorrow" do
    task = create(:task)
    tomorrow = Date.tomorrow
    assert_equal tomorrow, task.due_date
  end
end
