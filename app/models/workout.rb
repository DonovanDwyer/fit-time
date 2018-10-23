class Workout < ApplicationRecord
  has_many :workout_joins
  has_many :exercises, through: :workout_joins
  belongs_to :user
  validates :name, presence: true
  validates :total_time, presence: true
  # validate :ex_time_must_not_exceed_total_time

  # before_validation :time_remaining

  # def time_remaining
  #   if self.exercises != nil  || !self.exercises == nil
  #     return self.total_time
  #   else
  #   ex_time = self.exercises.map do |exercise|
  #     exercise.time
  #   end.reduce(:+)
  #
  #     return self.total_time - ex_time
  #   end
  # end

  # def ex_time_must_not_exceed_total_time
  #   if time_remaining < 0
  #     errors.add(:total_time, "must be equal to or more than exercise time")
  #   end
  # end

end
