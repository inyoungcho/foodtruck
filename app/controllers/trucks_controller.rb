class TrucksController < ApplicationController

  def show
    @truck = Truck.find params[:id]
    respond_with @truck
  end

end
