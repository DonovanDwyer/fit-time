class WorkoutsController < ApplicationController
  before_action :get_workout, only: [:show, :edit, :update, :destroy]
  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    # @exercises = Exercise.all
    # while @workout.time_remaining >= 0
    #   @workout.exercises << @exercises.sample
    # end
      redirect_to @workout  
  end

  def edit
  end

  def update
    @workout.update(workout_params)
    redirect_to @workout
  end

  def destroy
    @workout.destroy
    redirect_to new_workout_path
  end

  private

  def workout_params
    params.require(:workout).permit(:user_id, :description, :name, :rating, :total_time)
  end

  def get_workout
    @workout = Workout.find(params[:id])
  end
end
