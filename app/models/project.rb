class Project < ActiveRecord::Base
  validates :projectname, presence: true
  
  belongs_to :user
  has_many :tasks
end
