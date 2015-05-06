require 'test_helper'

class UpdateTaskMailerTest < ActionMailer::TestCase
  test "it sends email" do
    email = "foo@bar.com"
    task = create(:task)
    email = UpdateTaskMailer.update_task_email(email, task).deliver_now
    altered_result = "Youupdatedthefollowingtask:Dothisthing1Dueon:2015-05-07Status:incomplete"

    assert_equal ['laurawhalin@gmail.com'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal altered_result, email.body.to_s.split(" ").join
  end
end
