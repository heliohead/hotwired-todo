class User < ApplicationRecord
  has_many :todos

  validates :username, presence: true, uniqueness: true
end
