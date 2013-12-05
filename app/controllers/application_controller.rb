#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to controller: 'home', action: 'index'
      flash[:error] = 'Пожалуйста пройдите авторизацию'
    end
  end
end
