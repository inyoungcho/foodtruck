class TrucksController < ApplicationController
  include ApplicationHelper

  def index
    @trucks = Truck.available_on current_weekday
  end


end
