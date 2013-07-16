class Truck < ActiveRecord::Base
  validates_presence_of :name, :kind, :description
  validates_uniqueness_of :name
  has_many :slots

  # Returns all trucks with slots available on the given day
  def self.available_on day
    joins(:slots).merge(Slot.available_on(day)).includes(:slots)
  end

  def available_on? day
    slots.where(weekday: day).any?
  end

  def slot_for_day day
    slots.find_by_weekday day
  end

end
