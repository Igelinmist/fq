#encoding: utf-8
class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @page_title = 'УПРАВЛЕНИЕ ТОПЛИВА И ТРАНСПОРТА<br />стартовая страница приложения по контролю качества топлива'
    @news = News.where(dttm: Date.today.beginning_of_quarter .. Date.tomorrow).order('dttm DESC')
  end
end
