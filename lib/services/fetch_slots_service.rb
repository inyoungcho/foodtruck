module Services
  class FetchSlotsService

    def call options = {}
      # If the weekday is specified, fetch for that weekday
      # If no weekday is specified, fetch all slots
      query = Slot.available_on(options[:weekday]) if options[:weekday].present?
      query ||= Slot.all

      query.tap do
        query.joins!(:truck).includes!(:truck)
        query.merge!(Truck.of_kind(options[:kind])) if options.has_key?(:kind)
        query.merge!(Slot.in_neighborhood(options[:neighborhood])) if options.has_key?(:neighborhood)
      end
    end

  end
end