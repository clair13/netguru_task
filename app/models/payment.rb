class Payment < ActiveRecord::Base
  validates_presence_of :subscription
  validates_presence_of :student_id
  belongs_to :student
end
