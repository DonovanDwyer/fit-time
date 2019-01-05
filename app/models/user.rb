class User < ApplicationRecord
  has_many :workouts
  has_many :exercises, through: :workouts
  validates :name, presence: true, uniqueness: true
  has_secure_password

  # def password=(pass)
  #   self.password_digest = pass
  # end
end
