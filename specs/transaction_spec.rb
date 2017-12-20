require('minitest/autorun')
require('minitest/rg')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')


class TestTransaction < MiniTest::Test

  def setup()
    @tag1 = Tag.new({"id" => 1, "name" => "Clothes"})
    @vendor1 = Vendor.new({"id" => 1, "name" => "Tesco"})
    @transaction1 = Transaction.new({"id" => 1, "transaction_date" => "29/11/2017", "amount" => 2000, "tag_id" => @tag1.id, "vendor_id" => @vendor1.id})
    @transaction2 = Transaction.new({"id" => 1, "transaction_date" => "29/11/2017", "amount" => 20.00, "tag_id" => @tag1.id, "vendor_id" => @vendor1.id})
  end

  def test_transaction_has_id()
    expected = 1
    actual = @transaction1.id
    assert_equal(expected, actual)
  end

  def test_transaction_has_date()
    expected = '29/11/2017'
    actual = @transaction1.transaction_date
    assert_equal(expected, actual)
  end

  def test_transaction_has_amount()
    expected = 20.00
    actual = @transaction2.amount
    assert_equal(expected, actual)
  end

  def test_transaction_has_tag_id()
    expected = 1
    actual = @transaction1.tag_id
    assert_equal(expected, actual)
  end

  def test_transaction_has_vendor_id()
    expected = 1
    actual = @transaction1.vendor_id
    assert_equal(expected, actual)
  end

  def test_convert_amount_pence_to_pounds()
    expected = 20.00
    actual = @transaction1.amount_pence_to_pounds()
    assert_equal(expected, actual)
  end

  def test_convert_amount_pounds_to_pence()
    expected = 2000
    actual = @transaction2.amount_pounds_to_pence()
    assert_equal(expected, actual)
  end

end
