class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login

  def login
    if session[:user_id].blank?
      user = User.create
      session[:user_id] = user.id
    end
    @user_id = session[:user_id]
  end
end
