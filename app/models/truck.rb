class Truck < ActiveRecord::Base
  include CurrentWeekday

  validates_presence_of :name, :kind, :description
  validates_uniqueness_of :name
  has_many :slots

  # Returns all trucks with slots available today
  def self.available_today
    joins(:slots).merge(Slot.today)
  end

  def available_today?
    # slots.accept { |s| s.weekday == Time.now.strftime('%A') }.any?
    slots.where(weekday: current_weekday).any?
  end

end
