require 'minitest/autorun'
require 'minitest/pride'
require './lib/links'

class TestLinks < Minitest::Test

  def test_it_can_create_simple_link
    input = '[home page](http://www.espn.com)'
    expected = "<a href='http://www.espn.com'>home page</a>"
    output = Links.new(input)
    assert_equal expected, output.a_href_tag
  end

  def test_it_can_create_link_with_title
    input = "[home page](http://www.espn.com 'Sports')"
    expected = "<a href='http://www.espn.com' title='Sports'>home page</a>"
    output = Links.new(input)
    assert_equal expected, output.a_href_tag
  end

  def test_it_can_create_simple_link_within_a_sentence
    input = "I like <em>dinosaurs and tigers</em> on [home page](http://www.espn.com)."
    expected = "I like <em>dinosaurs and tigers</em> on <a href='http://www.espn.com'>home page</a>."
    output = Links.new(input)
    assert_equal expected, output.make_string
  end


end

