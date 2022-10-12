class Todo < ApplicationRecord
  belongs_to :user

  enum status: {active: 0, completed: 1}

  validates_presence_of :title
end
