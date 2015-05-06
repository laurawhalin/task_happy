class UpdateTaskMailer < ApplicationMailer
  default from: "laurawhalin@gmail.com"

  def update_task_email(email, task)
    mail(to: email,
         subject: 'You updated a task!',
         body: "You updated the following task: \n
               #{task.title} \n
               Due on: #{task.due_date} \n
               Status: #{task.status}"
        )
  end
end
