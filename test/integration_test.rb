require 'minitest/autorun'
require 'minitest/pride'
require './lib/text'


class TestIntegration < Minitest::Test

  def test_just_a_header
    input = '### This is a H3 Header'
    expected = "<h3>This is a H3 Header</h3>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph
    input = "# Alex's blog\n\nAlex is a student at Turing.\nHe lives in Denver, CO."
    expected = "<h1>Alex's blog</h1>\n\n<p>\n\tAlex is a student at Turing.\n\tHe lives in Denver, CO.\n</p>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_unordered_list
    input = "* Math\n* Physics"
    expected = "<ul>\n\t<li>Math</li>\n\t<li>Physics</li>\n</ul>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_paragraph_and_unordered_list
    input = "His favorite subjects are:\n\n* Math\n* Physics"
    expected = "<p>\n\tHis favorite subjects are:\n</p>\n\n<ul>\n\t<li>Math</li>\n\t<li>Physics</li>\n</ul>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph_and_unordered_list_and_tags
    input = "## Alex's blog\n\nHis **favorite** subjects are:\n\n1. Math\n2. Physics\n3. Biology"
    expected = "<h2>Alex's blog</h2>\n\n<p>\n\tHis <strong>favorite</strong> subjects are:\n</p>\n\n<ol>\n\t<li>Math</li>\n\t<li>Physics</li>\n\t<li>Biology</li>\n</ol>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph_and_unordered_list_and_tags_and_links
    input = "## Alex's blog\n\nHis **favorite** subjects are:\n\n1. Math\n2. Physics\n3. Biology\n\nHis favorite website is [home page](http://www.espn.com 'Sports'). Great site."
    expected = "<h2>Alex's blog</h2>\n\n<p>\n\tHis <strong>favorite</strong> subjects are:\n</p>\n\n<ol>\n\t<li>Math</li>\n\t<li>Physics</li>\n\t<li>Biology</li>\n</ol>\n\n<p>\n\tHis favorite website is <a href='http://www.espn.com' title='Sports'>home page</a>. Great site.\n</p>\n\n"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end


end