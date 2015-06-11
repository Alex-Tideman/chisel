require 'minitest/autorun'
require 'minitest/pride'
require './lib/strong'

class TestStrong < Minitest::Test

  def test_add_strong_tag
    input = 'Here is some **bold** text'
    expected = 'Here is some <strong>bold</strong> text'
    output = Strong.new(input)
    assert_equal expected, output.make_string
  end

  def test_multiple_strong_tags
    input = 'I like **dinosaurs** and **tigers**'
    expected = 'I like <strong>dinosaurs</strong> and <strong>tigers</strong>'
    output = Strong.new(input)
    assert_equal expected, output.make_string
  end

  def test_multiple_strong_tags_with_single_astericks_as_well
    input = 'I like **dinosaurs** and **tigers** but *not* mongoose.'
    expected = 'I like <strong>dinosaurs</strong> and <strong>tigers</strong> but *not* mongoose.'
    output = Strong.new(input)
    assert_equal expected, output.make_string
  end

  def test_multiple_strong_tags_within_single_astericks
    input = 'I *like **dinosaurs** and **tigers** but not mongoose.*'
    expected = 'I *like <strong>dinosaurs</strong> and <strong>tigers</strong> but not mongoose.*'
    output = Strong.new(input)
    assert_equal expected, output.make_string
  end

  def test_multiple_single_astericks_within_sing_strong
    input = 'I **like *dinosaurs* and *tigers* but not mongoose.**'
    expected = 'I <strong>like *dinosaurs* and *tigers* but not mongoose.</strong>'
    output = Strong.new(input)
    assert_equal expected, output.make_string
  end

  #TESTING INTEGRATION WITH EM CLASS
  def test_multiple_strong_tags_with_em_tags_as_well
    input = 'I like **dinosaurs** and **tigers** but *not* mongoose.'
    expected = 'I like <strong>dinosaurs</strong> and <strong>tigers</strong> but <em>not</em> mongoose.'
    output = Strong.new(input)
    assert_equal expected, output.send_to_em
  end

  def test_single_strong_tag_with_em_tags_as_well
    input = 'I like **dinosaurs and *tigers* but *not* mongoose.**'
    expected = 'I like <strong>dinosaurs and <em>tigers</em> but <em>not</em> mongoose.</strong>'
    output = Strong.new(input)
    assert_equal expected, output.send_to_em
  end

  def test_single_em_tag_with_multiple_strong_tags_as_well
    input = 'I like *dinosaurs and **tigers but not** mongoose.*'
    expected = 'I like <em>dinosaurs and <strong>tigers but not</strong> mongoose.</em>'
    output = Strong.new(input)
    assert_equal expected, output.send_to_em
  end

end