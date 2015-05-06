require 'test_helper'

class NewTaskMailerTest < ActionMailer::TestCase
  test "it sends email" do
    email = "foo@bar.com"
    task = create(:task)
    email = NewTaskMailer.new_task_email(email, task).deliver_now
    altered_result = "Youcreatedanewtask:Dothisthing1Dueon:2015-05-07Status:incomplete"

    assert_equal ['laurawhalin@gmail.com'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal altered_result, email.body.to_s.split(" ").join
  end
end
