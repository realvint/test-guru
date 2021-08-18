class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      cookies[:current_url] = request.original_url
      redirect_to login_path, alert: 'Для входа нужно авторизоваться'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
