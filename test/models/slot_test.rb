require 'test_helper'

class SlotTest < ActiveSupport::TestCase
  test "returns slots present weekday" do
    a = FactoryGirl.create(:slot, weekday: 'Monday')
    b = FactoryGirl.create(:slot, weekday: 'Monday')
    c = FactoryGirl.create(:slot, weekday: 'Tuesday')

    Timecop.freeze Chronic.parse('next Monday')

    slots = Slot.today
    assert slots.include?(a)
    assert slots.include?(b)
    assert !slots.include?(c)
  end
end
