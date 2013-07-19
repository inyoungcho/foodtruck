module Services
  class DrilldownOptionsService

    # Prepares the options used to populate the select fields in the drilldown menu
    def call
      options = {}
      options.tap do
        options[:weekdays] = available_weekdays
        options[:neighborhoods] = available_neighborhoods
        options[:kinds] = available_kinds
      end
    end

    private
    def available_weekdays
      JunkDrawer::Weekdays.weekdays
    end

    def available_neighborhoods
      Slot.available_neighborhoods
    end

    def available_kinds
      Truck.available_kinds
    end

  end
end