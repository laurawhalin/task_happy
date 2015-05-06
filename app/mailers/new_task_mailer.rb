class NewTaskMailer < ApplicationMailer
  default from: "laurawhalin@gmail.com"

  def new_task_email(email, task)
    mail(to: email,
         subject: 'You created a new task!',
         body: "You created a new task: \n
                #{task.title} \n
                Due on: #{task.due_date} \n
                Status: #{task.status}"
         )
  end
end
