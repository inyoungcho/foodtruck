class EmberController < ApplicationController
  before_filter :load_services
  respond_to :html

  # Render just the layout, since we're using EmberJS
  def index
    @drilldown_options = @drilldown_options_service.call
    render 'layouts/application'
  end

  private
  def load_services
    @drilldown_options_service = Services::DrilldownOptionsService.new
  end

end