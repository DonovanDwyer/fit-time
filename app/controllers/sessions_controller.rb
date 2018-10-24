class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :destroy, :create]

  def new

  end

  def create
    user = User.find_by(name: params[:session][:name])
    # byebug
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:error] = "Invalid Username/Password Combination"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
