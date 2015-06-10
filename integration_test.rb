require 'minitest/autorun'
require 'minitest/pride'
# require './lib/renderer'
require_relative 'text'


class TestIntegration < Minitest::Test

  def test_just_a_header
    input = '###This is a H3 Header'
    expected = '<h3>This is a H3 Header</h3>'
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph
    input = "#Alex's blog\n\nAlex is a student at Turing.\nHe lives in Denver, CO."
    expected = "<h1>Alex's blog</h1><p>Alex is a student at Turing.\nHe lives in Denver, CO.</p>"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_unordered_list
    input = "* Math\n* Physics"
    expected = "<ul><li>Math</li>\n<li>Physics</li>\n</ul>"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_paragraph_and_unordered_list
    input = "His favorite subjects are:\n\n* Math\n* Physics"
    expected = "<p>His favorite subjects are:</p><ul><li>Math</li>\n<li>Physics</li>\n</ul>"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph_and_unordered_list_and_tags
    input = "##Alex's blog\n\nHis **favorite** subjects are:\n\n1. Math\n2. Physics\n3. Biology"
    expected = "<h2>Alex's blog</h2><p>His <strong>favorite</strong> subjects are:</p><ol><li>Math</li>\n<li>Physics</li>\n<li>Biology</li>\n</ol>"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end

  def test_header_and_paragraph_and_unordered_list_and_tags_links
    input = "##Alex's blog\n\nHis **favorite** subjects are:\n\n1. Math\n2. Physics\n3. Biology\n\nHis favorite website is [home page](http://www.espn.com 'Sports'). Great site."
    expected = "<h2>Alex's blog</h2><p>His <strong>favorite</strong> subjects are:</p><ol><li>Math</li>\n<li>Physics</li>\n<li>Biology</li>\n</ol><p>His favorite website is <a href='http://www.espn.com' title='Sports'>home page</a>. Great site.</p>"
    output = Text.new(input)
    assert_equal expected, output.join_message
  end


end