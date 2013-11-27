#encoding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
    @page_title = 'Авторизация пользователя системы'
  end

  def create
    user = User.find_by_login(params[:login])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Неверная комбинация имени и пароля'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to coil_assays_url, 'Сеанс работы завершен'
  end
end
