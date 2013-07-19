require 'test_helper'

class Services::DrilldownOptionsServiceTest < ActiveSupport::TestCase

  setup do
    @service = Services::DrilldownOptionsService.new
  end

  test "returns a hash including available neighborhoods" do
    2.times { FactoryGirl.create :slot, neighborhood: 'A' }
    FactoryGirl.create :slot, neighborhood: 'B'

    options = @service.call
    assert_equal 2, options[:neighborhoods].size
    assert options[:neighborhoods].include?('A')
    assert options[:neighborhoods].include?('B')
  end

  test "returns a hash including possible weekdays" do
    assert_equal JunkDrawer::Weekdays.weekdays, @service.call[:weekdays]
  end

  test "returns a hash including available truck kinds" do
    2.times { FactoryGirl.create :truck, kind: 'A' }
    FactoryGirl.create :truck, kind: 'B'

    options = @service.call
    assert_equal 2, options[:kinds].size
    assert options[:kinds].include?('A')
    assert options[:kinds].include?('B')
  end

end