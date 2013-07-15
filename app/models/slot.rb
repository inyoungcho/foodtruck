class Slot < ActiveRecord::Base
  extend CurrentWeekday

  validates_inclusion_of :weekday, in: weekdays
  validates_presence_of :truck, :weekday, :address, :neighborhood, :period
  belongs_to :truck

  # Returns all time slots available today
  def self.today
    where(weekday: current_weekday)
  end

end
