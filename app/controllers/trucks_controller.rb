class TrucksController < ApplicationController
  def index
    @trucks = Truck.available_today
  end


end
