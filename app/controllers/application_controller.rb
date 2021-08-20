class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(user)
    flash[:notice] = "Привет, #{user.name} #{user.surname}!"
    if user.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name surname email password password_confirmation])

    devise_parameter_sanitizer.permit(:sign_in, keys:
      %i[name surname email password remember_me])

    devise_parameter_sanitizer.permit(:account_update, keys:
      %i[name surname email password password_confirmation current_password])
  end
end
