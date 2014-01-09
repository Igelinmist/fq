#encoding: utf-8
class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @page_title = 'Управление топлива и транспорта'
    @news = News.where(dttm: Date.today.beginning_of_quarter .. Date.tomorrow).order('dttm DESC')
  end
end
