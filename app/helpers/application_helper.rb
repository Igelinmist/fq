#encoding: utf-8
module ApplicationHelper
  def start_of_hour
    t = Time.now
    Time.local(t.year,t.month,t.day,t.hour)
  end

  def first_day_of_month(dt)
    date = Date.parse dt
    return "01.#{date.month}.#{date.year}"
  end



end
