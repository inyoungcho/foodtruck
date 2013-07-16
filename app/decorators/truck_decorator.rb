class TruckDecorator < Draper::Decorator
  delegate_all

  def slot
    object.slot_for_day h.current_weekday
  end

end
