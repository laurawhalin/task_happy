class List < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: { message: "That list title has already been used." }
  has_many :tasks

  def archive!
    if self.active == true
      self.active = false
    else
      self.active = true
    end
    save
  end
end
