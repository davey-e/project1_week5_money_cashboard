require('minitest/autorun')
require('minitest/rg')
require_relative('../models/tag.rb')

class TestTag < MiniTest::Test

  def setup()
    @tag1 = Tag.new({"id" => 1, "name" => "Clothes"})
  end

  def test_tag_has_id()
    expected = 1
    actual = @tag1.id
    assert_equal(expected, actual)
  end

  def test_tag_has_name()
    expected = "Clothes"
    actual = @tag1.name
    assert_equal(expected, actual)
  end
end
