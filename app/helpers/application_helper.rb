module ApplicationHelper

  def current_weekday
    JunkDrawer::Weekdays.current_weekday
  end

  def configuration
    $configuration
  end

end
