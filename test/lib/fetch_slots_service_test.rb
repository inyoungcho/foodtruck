require 'test_helper'

class Services::FetchSlotsServiceTest < ActiveSupport::TestCase

  setup do
    @service = Services::FetchSlotsService.new
    Timecop.freeze Chronic.parse('next Monday')
  end

  teardown do
    Timecop.return
  end

  test "always fetches just one day with a weekday specified" do
    a = FactoryGirl.create :slot, weekday: 'Monday'
    b = FactoryGirl.create :slot, weekday: 'Tuesday'

    assert_includes_only b, @service.call(weekday: 'Tuesday')
  end

  test "allows querying by truck kind" do
    a = FactoryGirl.create :truck, kind: 'A'
    b = FactoryGirl.create :truck, kind: 'B'

    FactoryGirl.create :slot, truck: a
    FactoryGirl.create :slot, truck: b

    assert_equal 2, @service.call.size

    results_a = @service.call kind: 'A'
    results_b = @service.call kind: 'B'

    assert_equal 1, results_a.size
    assert_equal 1, results_b.size
    assert_equal a, results_a.first.truck
    assert_equal b, results_b.first.truck
  end

  test "allows querying by slot neighborhood" do
    a = FactoryGirl.create :slot, neighborhood: 'A'
    b = FactoryGirl.create :slot, neighborhood: 'B'

    assert_equal 2, @service.call.size

    assert_includes_only a, @service.call(neighborhood: 'A')
    assert_includes_only b, @service.call(neighborhood: 'B')
  end

  test "allows querying by all three parameters" do
    truck = FactoryGirl.create :truck, kind: 'K'
    slot = FactoryGirl.create :slot, truck: truck, neighborhood: 'N', weekday: 'Friday'

    # These only match some of the parameters
    FactoryGirl.create :slot, neighborhood: 'N'
    FactoryGirl.create :slot, weekday: 'Friday'
    FactoryGirl.create :slot, truck: truck

    # Totally different parameters
    FactoryGirl.create :slot

    assert_includes_only slot, @service.call(weekday: 'Friday', neighborhood: 'N', kind: 'K')
  end

  test "allows fetching all slots" do
    a = FactoryGirl.create :slot, weekday: 'Friday'
    b = FactoryGirl.create :slot, weekday: 'Thursday'

    results = @service.call fetch_all: true
    assert_includes results, a
    assert_includes results, b
  end

end