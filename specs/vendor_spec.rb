require('minitest/autorun')
require('minitest/rg')
require_relative('../models/vendor.rb')

class TestVendor < MiniTest::Test

  def setup()
    @vendor1 = Vendor.new({"id" => 1, "name" => "Tesco"})
  end

  def test_vendor_has_id()
    expected = 1
    actual = @vendor1.id
    assert_equal(expected, actual)
  end

  def test_vendor_has_name()
    expected = "Tesco"
    actual = @vendor1.name
    assert_equal(expected, actual)
  end
end
