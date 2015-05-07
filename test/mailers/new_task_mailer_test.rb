require 'test_helper'

class NewTaskMailerTest < ActionMailer::TestCase
  test "it sends email" do
    email = "foo@bar.com"
    task = create(:task, title: "Love sending that email! //cc laurawhalin@gmail.com")
    email = NewTaskMailer.new_task_email(email, task).deliver_now
    tomorrow = Date.tomorrow
    altered_result = "Youcreatedanewtask:Lovesendingthatemail!Dueon:#{tomorrow}Status:incomplete"

    assert_equal ['laurawhalin@gmail.com'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal altered_result, email.body.to_s.split(" ").join
  end
end
