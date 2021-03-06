require 'test_helper'

class SlotTest < ActiveSupport::TestCase

  test "returns slots present weekday" do
    a = FactoryGirl.create(:slot, weekday: 'Monday')
    b = FactoryGirl.create(:slot, weekday: 'Monday')
    c = FactoryGirl.create(:slot, weekday: 'Tuesday')

    slots = Slot.available_on 'Monday'
    assert slots.include?(a)
    assert slots.include?(b)
    assert !slots.include?(c)
  end

  test "returns slots in a specific neighborhood" do
    a = FactoryGirl.create :slot, neighborhood: 'A'
    b = FactoryGirl.create :slot, neighborhood: 'B'

    assert_includes_only a, Slot.in_neighborhood('A')
    assert_includes_only b, Slot.in_neighborhood('B')
  end

  test "returns unique available neighborhoods" do
    2.times { FactoryGirl.create :slot, neighborhood: 'A' }
    FactoryGirl.create :slot, neighborhood: 'B'

    results = Slot.available_neighborhoods
    assert_equal 2, results.size
    assert results.include?('A')
    assert results.include?('B')
  end

end
