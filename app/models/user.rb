class User < ApplicationRecord
  enum role: [:student, :monitor, :teacher]
  has_many :points
  validates :code, presence: true
  has_secure_password
end
