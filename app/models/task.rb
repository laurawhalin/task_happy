class Task < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: { message: "You already added that item to this list!"}
  validates :status, presence: true

  has_attached_file :image, styles: { thumb: "100x100" }
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :list

  before_save :set_due_date
  after_create :send_new_task_email
  after_update :send_update_task_email

  scope :complete, -> { where status: "complete" }
  scope :incomplete, -> { where status: "incomplete" }
  scope :last_updated, -> { order("tasks.updated_at").last }

  def complete!
    if self.status == "complete"
      self.status = "incomplete"
    else
      self.status = "complete"
    end
    save
  end

  def complete?
    self.status == "complete"
  end

  private

  def set_due_date
    self.due_date = Date.tomorrow if new_record?
  end

  def send_new_task_email
    NewTaskMailer.new_task_email(email="laurawhalin@gmail.com", Task.last).deliver_now
  end

  def send_update_task_email
    UpdateTaskMailer.update_task_email(email="laurawhalin@gmail.com", Task.last_updated).deliver_now
  end
end
