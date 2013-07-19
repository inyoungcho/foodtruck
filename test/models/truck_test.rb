require 'test_helper'

class TruckTest < ActiveSupport::TestCase

  test "returns food trucks with slots open for a given day" do
    slot_a = FactoryGirl.create(:slot, weekday: 'Monday')
    slot_b = FactoryGirl.create(:slot, weekday: 'Monday')
    slot_c = FactoryGirl.create(:slot, weekday: 'Tuesday')

    trucks_today = Truck.available_on 'Monday'
    assert trucks_today.include?(slot_a.truck)
    assert trucks_today.include?(slot_b.truck) 
    assert !trucks_today.include?(slot_c.truck) 
  end

  test "can check if truck is available today with a record" do
    truck_yes = FactoryGirl.create(:slot, weekday: 'Monday').truck
    truck_no = FactoryGirl.create(:slot, weekday: 'Tuesday').truck

    assert truck_yes.available_on?('Monday')
    assert !truck_no.available_on?('Monday')
  end

  test "returns trucks of a specific kind" do
    a = FactoryGirl.create :truck, kind: 'A'
    b = FactoryGirl.create :truck, kind: 'B'

    assert_includes_only a, Truck.of_kind('A')
    assert_includes_only b, Truck.of_kind('B')
  end

  test "returns unique available kinds" do
    2.times { FactoryGirl.create :truck, kind: 'A' }
    FactoryGirl.create :truck, kind: 'B'

    results = Truck.available_kinds
    assert_equal 2, results.size
    assert results.include?('A')
    assert results.include?('B')
  end

end
