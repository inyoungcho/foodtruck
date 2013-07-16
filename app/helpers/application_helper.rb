require 'junk_drawer/weekdays'

module ApplicationHelper

  def current_weekday
    JunkDrawer::Weekdays.current_weekday
  end

end
