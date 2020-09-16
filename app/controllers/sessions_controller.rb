class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (cookies[:url] || tests_path)
    else
      flash.now[:alert] = 'Ошибка авторизации. Проверьте пароль и/или email.'
      render :new
    end
  end

  def destroy
    cookies[:url] = nil
    session[:user_id] = nil
    redirect_to login_path
  end
end
