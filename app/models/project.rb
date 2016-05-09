class Project < ActiveRecord::Base
  validates :projectname, presence: true
  
  has_and_belongs_to_many :users
  has_many :tasks
end
