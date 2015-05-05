class Task < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: { message: "You already added that item to this list!"}
  validates :status, presence: true

  belongs_to :list

  before_save :set_due_date

  private

  def set_due_date
    self.due_date = Date.tomorrow if new_record?
  end
end
