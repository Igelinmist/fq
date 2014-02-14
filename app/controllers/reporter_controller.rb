#encoding: utf-8
class ReporterController < ApplicationController
  def view
    @authorized_user = User.find(session[:user_id])
    @page_title = 'Отчет по качеству топлива'
    report_time = Date.today
    @coil_assays = @gaz_assays = @masut_assays = nil
    @report_dates =
        case params[:period]
          when 'За последний месяц' then {:start_date => report_time.months_ago(1), :end_date => report_time}
          when 'Текущий месяц' then {:start_date => report_time.at_beginning_of_month, :end_date => report_time}
          when 'Прошлый месяц' then {:start_date => report_time.months_ago(1).at_beginning_of_month, :end_date => report_time.months_ago(1).end_of_month}
          when 'Текущий квартал' then {:start_date => report_time.at_beginning_of_quarter, :end_date => report_time}
          when 'Текущий год' then {:start_date => report_time.at_beginning_of_year, :end_date => report_time}
          else {:start_date => report_time.at_beginning_of_month, :end_date => report_time}
        end
    case params[:fuel]
      when 'Уголь'
        @coil_assays = CoilAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
      when 'Газ'
        @gaz_assays = GazAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
      when 'Мазут'
        @masut_assays = MasutAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
      when 'Все'
        @coil_assays = CoilAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
        @gaz_assays = GazAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
        @masut_assays = MasutAssay.za_period(params[:period]).filter_sp(@authorized_user.subdivision)
    end

  end
end
