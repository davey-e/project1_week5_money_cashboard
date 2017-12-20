require('minitest/autorun')
require('minitest/rg')
require_relative('../models/budget.rb')

class TestBudget < MiniTest::Test

  def setup()
    @budget1 = Budget.new({"id" => 1, "amount" => 1000.00})
  end

  def test_budget_has_id()
    expected = 1
    actual = @budget1.id
    assert_equal(expected, actual)
  end

  def test_budget_has_amount()
    expected = 1000.00
    actual = @budget1.amount
    assert_equal(expected, actual)
  end
end
