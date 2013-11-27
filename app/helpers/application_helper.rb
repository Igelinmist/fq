module ApplicationHelper
  def start_of_hour
    t = Time.now
    Time.local(t.year,t.month,t.day,t.hour)
  end
end
