class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Привет, #{current_user.name} #{current_user.surname}!"
  end
end