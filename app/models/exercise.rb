class Exercise < ApplicationRecord
  has_many :workout_joins
  has_many :workouts, through: :workout_joins
  has_many :images
  # validates :name, presence: true, uniqueness: true
  # validates :form, presence: true
  # validates :part, presence: true, numericality: true
  # validates :function, presence: true
  # validates :instructions, presence: true
  # validates :time, presence: true, numericality: true
end
