class TrucksController < ApplicationController
  after_filter :allow_static_caching

  def show
    @truck = Truck.find params[:id]
    respond_with @truck
  end

end
