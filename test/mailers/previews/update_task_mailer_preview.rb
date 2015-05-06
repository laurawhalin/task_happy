# Preview all emails at http://localhost:3000/rails/mailers/update_task_mailer
class UpdateTaskMailerPreview < ActionMailer::Preview
  def update_task_email_preview
    email = "laurawhalin@gmail.com"
    task = Task.last
    UpdateTaskMailer.update_task_email(email, task)
  end
end
