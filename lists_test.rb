require 'minitest/autorun'
require 'minitest/pride'
# require './lib/renderer'
require_relative 'lists'

class TestLists < Minitest::Test

  #Unordered list
  def test_math_and_physics
    input = '* Math\n* Physics'
    expected = '<li>Math</li>\n<li>Physics</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_one_bullet_list
    input = '* One'
    expected = '<li>One</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_two_bullet_list
    input = '* one\n* two'
    expected = '<li>one</li>\n<li>two</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_many_bullet_list
    input = '* one\n* two\n* three\n* four\n* five'
    expected = '<li>one</li>\n<li>two</li>\n<li>three</li>\n<li>four</li>\n<li>five</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  #Ordered list
  def test_one_numbered_list
    input = '1. One'
    expected = '<li>One</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end


  def test_two_number_list
    input = '1. one\n2. two'
    expected = '<li>one</li>\n<li>two</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_many_number_list
    input = '1. one\n2. two\n3. three\n4. four\n5. five'
    expected = '<li>one</li>\n<li>two</li>\n<li>three</li>\n<li>four</li>\n<li>five</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  #Integration test with em and strong tags
  def test_many_number_list_with_em_tag
    input = '1. one\n2. two\n3. *three*\n4. four\n5. five'
    expected = '<li>one</li>\n<li>two</li>\n<li><em>three</em></li>\n<li>four</li>\n<li>five</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_number_list_with_strong_tag
    input = '1. one\n2. **two**\n3. three\n4. four\n5. five'
    expected = '<li>one</li>\n<li><strong>two</strong></li>\n<li>three</li>\n<li>four</li>\n<li>five</li>\n'
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_number_list_with_strong_and_em_tag
    input = '1. one\n2. **two**\n3. three\n4. four\n5. *five*'
    expected = '<li>one</li>\n<li><strong>two</strong></li>\n<li>three</li>\n<li>four</li>\n<li><em>five</em></li>\n'
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_bullet_list_with_strong_and_em_tag
    input = '* one\n* two\n* *three*\n* four\n* **five**'
    expected = '<li>one</li>\n<li>two</li>\n<li><em>three</em></li>\n<li>four</li>\n<li><strong>five</strong></li>\n'
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end


end
