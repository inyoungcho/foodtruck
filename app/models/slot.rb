class Slot < ActiveRecord::Base
  validates_inclusion_of :weekday, in: JunkDrawer::Weekdays.weekdays
  validates_presence_of :truck, :weekday, :address, :neighborhood, :period
  belongs_to :truck

  # Returns all time slots available for the day
  def self.available_on day
    where(weekday: day)
  end

end
