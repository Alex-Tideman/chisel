require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'strikethrough'

class TestStrikethrough < Minitest::Test

  def test_it_exists
      assert Strikethrough
  end

  def test_long_strikethrough
    input = '~~Do not use this text.~~'
    expected = '<del>Do not use this text.</del>'
    output = Strikethrough.new.parse(input)
    assert_equal expected, output
  end

end