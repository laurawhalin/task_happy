# Preview all emails at http://localhost:3000/rails/mailers/new_task_mailer
class NewTaskMailerPreview < ActionMailer::Preview
  def new_task_email_preview
    email = "laurawhalin@gmail.com"
    task = Task.last
    NewTaskMailer.new_task_email(email, task)
  end
end
