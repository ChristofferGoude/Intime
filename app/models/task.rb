class Task < ActiveRecord::Base
  validates :taskname, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 200 }
  
  belongs_to :project
end
