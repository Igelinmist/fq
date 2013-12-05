#encoding: utf-8
class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @page_title = 'Управление топлива и транспорта'
  end
end
