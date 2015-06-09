require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'em'

class TestEm < Minitest::Test

  def test_single_em_tag
    input = 'Here is some *italics* text'
    expected = 'Here is some <em>italics</em> text'
    output = Em.new(input)
    assert_equal expected, output.make_string
  end

  def test_multiple_em_tags
    input = 'I like *dinosaurs* and *tigers*'
    expected = 'I like <em>dinosaurs</em> and <em>tigers</em>'
    output = Em.new(input)
    assert_equal expected, output.make_string
  end

  def test_single_em_tag_around_multiple_words
    input = 'I like *dinosaurs and tigers*'
    expected = 'I like <em>dinosaurs and tigers</em>'
    output = Em.new(input)
    assert_equal expected, output.make_string
  end
end

