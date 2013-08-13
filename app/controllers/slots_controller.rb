class SlotsController < ApplicationController
  before_filter :load_services
  after_filter :allow_static_caching

  def index
    @slots = @fetch_slots_service.call params.reject { |_, v| v.blank? }
    respond_with @slots
  end

  def available_filters
    respond_with @drilldown_options_service.call
  end

  private
  def load_services
    @fetch_slots_service = Services::FetchSlotsService.new
    @drilldown_options_service = Services::DrilldownOptionsService.new
  end

end
