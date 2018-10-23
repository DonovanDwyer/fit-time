class User < ApplicationRecord
  has_many :workouts
  validates :name, presence: true

  def password=(pass)
    self.password_digest = pass
  end
end
