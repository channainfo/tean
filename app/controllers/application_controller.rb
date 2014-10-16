class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :current_user

  protected

  def current_user
    if user_signed_in?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to login_path, alert: "You need to sign in first"
    end
  end

  def after_signed_in_path
    root_path
  end

  def after_signed_out_path
    login_path
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def default_serializer_options
    { 
      root: false
    }
  end
end
