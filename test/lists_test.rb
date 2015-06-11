require 'minitest/autorun'
require 'minitest/pride'
require './lib/lists'

class TestLists < Minitest::Test

  #Unordered list
  def test_one_bullet_list
    input = "* One"
    expected = "\t<li>One</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_two_bullet_list
    input = "* one\n\t* two"
    expected = "\t<li>one</li>\n\t<li>two</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_many_bullet_list
    input = "* one\n* two\n* three\n* four\n* five"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  #Ordered list
  def test_one_numbered_list
    input = "1. One"
    expected = "\t<li>One</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_two_number_list
    input = "1. one\n2. two"
    expected = "\t<li>one</li>\n\t<li>two</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  def test_many_number_list
    input = "1. one\n2. two\n3. three\n4. four\n5. five"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.make_string
  end

  #Integration test with em and strong tags
  def test_many_number_list_with_em_tag
    input = "1. one\n2. two\n3. *three*\n4. four\n5. five"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li><em>three</em></li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_number_list_with_strong_tag
    input = "1. one\n2. **two**\n3. three\n4. four\n5. five"
    expected = "\t<li>one</li>\n\t<li><strong>two</strong></li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_number_list_with_strong_and_em_tag
    input = "1. one\n2. **two**\n3. three\n4. four\n5. *five*"
    expected = "\t<li>one</li>\n\t<li><strong>two</strong></li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li><em>five</em></li>\n"
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end

  def test_many_bullet_list_with_strong_and_em_tag
    input = "* one\n* **two**\n* three\n* four\n* *five*"
    expected = "\t<li>one</li>\n\t<li><strong>two</strong></li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li><em>five</em></li>\n"
    output = Lists.new(input)
    assert_equal expected, output.get_other_tags
  end


end
