class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:current_url] || tests_path
    else
      flash.now[:alert] = 'Неправильный логин или пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:current_url] = nil
    redirect_to root_path
  end

end