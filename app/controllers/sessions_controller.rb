class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "#{t('.welcome')}, #{current_user.name} #{current_user.surname}!"
  end
end