#encoding: utf-8
class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @page_title = 'Управление топлива и транспорта'
    @news = News.order(:dttm).where(dttm: Date.today.beginning_of_quarter .. Date.tomorrow)
  end
end
