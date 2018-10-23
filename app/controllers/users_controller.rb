class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy, :create_workout]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def new_workout
    @workout = Workout.new
  end

  def create_workout
    # byebug
    @workout = Workout.create(user_id: params[:id], :description => workout_params[:description], :name => workout_params[:name],
    :total_time => workout_params[:total_time], :form => workout_params[:form], :function => workout_params[:function] )
    if @workout.valid?
      @workout.add_exercises
      redirect_to workout_path(@workout)
    else
      render 'new_workout'
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def workout_params
    params.require(:workout).permit(:user_id, :description, :name, :rating, :total_time, :form, :function)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
