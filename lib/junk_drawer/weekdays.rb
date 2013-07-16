module JunkDrawer
  module Weekdays

    WEEKDAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

    def self.weekdays
      WEEKDAYS
    end

    def self.current_weekday
      Time.now.strftime('%A')
    end

  end
end