require 'test_helper'

class UpdateTaskMailerTest < ActionMailer::TestCase
  test "it sends email" do
    email = "foo@bar.com"
    task = create(:task, title: "Show me the email //cc laurawhalin@gmail.com")
    email = UpdateTaskMailer.update_task_email(email, task).deliver_now
    tomorrow = Date.tomorrow
    altered_result = "Youupdatedthefollowingtask:ShowmetheemailDueon:#{tomorrow}Status:incomplete"

    assert_equal ['laurawhalin@gmail.com'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal altered_result, email.body.to_s.split(" ").join
  end
end
