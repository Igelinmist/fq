#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  protected
  def authorize
    if User.find_by_id(session[:user_id])
      @user = User.find(session[:user_id])
    end
  end
end
