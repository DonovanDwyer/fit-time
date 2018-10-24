class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  private

  def require_login
    if logged_in? == false
      flash[:error] = "You need to be logged in to do that"
      redirect_to login_path
    end
  end


end
