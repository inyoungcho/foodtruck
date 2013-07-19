module Services
  class FetchSlotsService

    def call options = {}
      weekday = options[:weekday]
      weekday ||= JunkDrawer::Weekdays.current_weekday
      query = Slot.available_on(weekday).joins(:truck).includes(:truck)

      query.tap do
        query.merge!(Truck.of_kind(options[:kind])) if options.has_key?(:kind)
        query.merge!(Slot.in_neighborhood(options[:neighborhood])) if options.has_key?(:neighborhood)
      end
    end

  end
end