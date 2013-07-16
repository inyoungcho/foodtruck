class SlotsController < ApplicationController
  before_filter :load_services

  def index
    @slots = @fetch_slots_for_weekday_service.call
  end

  private
    def load_services
      @fetch_slots_for_weekday_service ||= FetchSlotsForWeekdayService.new
    end

end
