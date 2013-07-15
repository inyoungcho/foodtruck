module CurrentWeekday
  # Giant @todo right here
  WEEKDAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  def weekdays
    WEEKDAYS
  end
  private :weekdays

  def current_weekday
    Time.now.strftime('%A')
  end
  private :current_weekday

end