module Services
  class FetchSlotsForWeekdayService

    def call options = {}
      day = options[:day]
      day ||= JunkDrawer::Weekdays.current_weekday
      Slot.available_on(day).joins(:truck).includes(:truck)
    end

  end
end