class Workout < ApplicationRecord
  has_many :workout_joins
  has_many :exercises, through: :workout_joins
  belongs_to :user
  validates :name, presence: true
  validates :total_time, presence: true

  def add_exercises

    @exercises_r = Exercise.all.select {|ex| ex.form.downcase == self.form.downcase &&
       ex.function.downcase == self.function.downcase}
    # byebug
    while self.remaining_time > 0
      if self.remaining_time == self.total_time
        @exercises = @exercises_r.select { |exercise| exercise.time <= self.total_time }
          self.exercises << @exercises.sample
      else
        @exercises = @exercises_r.select { |exercise| exercise.time <= self.remaining_time }
        self.exercises << unique_ex(@exercises)
      end
      # byebug
    end
  end

  def remaining_time
    if self.exercises.empty?
      # byebug
      return self.total_time
    else
      time_for_exercises = self.exercises.map do |exercise|
        exercise.time
      end.reduce(:+)
      self.total_time - time_for_exercises
    end
  end

  def unique_ex(array)
    array.shuffle.each do |exe|
      if self.exercises.include?(exe) == false
        return exe
      end
    end
  end

  def replace(ex)
    self.exercises.delete(ex)
    # @exercise = Exercise.all.select {|exe| exe != ex}
    # self.exercises << @exercise.sample
    self.add_exercises
  end

end
