class SlotsController < ApplicationController
  before_filter :load_services

  def index
    @slots = @fetch_slots_service.call params.reject { |_, v| v.blank? }
    respond_with @slots
  end

  private
  def load_services
    @fetch_slots_service = Services::FetchSlotsService.new
  end

end
