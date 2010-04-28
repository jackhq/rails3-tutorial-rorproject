class Task < ActiveRecord::Base
  belongs_to :project
  scope :completed, lambda {
    where("completed == ?", true)
  }
end
