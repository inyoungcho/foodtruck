class SlotsController < ApplicationController
  before_filter :load_services

  def index
    @slots = @fetch_slots_for_weekday_service.call
    respond_with @slots
  end

  private
    def load_services
      @fetch_slots_for_weekday_service ||= Services::FetchSlotsForWeekdayService.new
    end

end
