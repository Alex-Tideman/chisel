require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'links'

class TestLinks < Minitest::Test

  def test_it_can_create_simple_link
      input = '[home page](http://www.espn.com)'
      expected =
      <p><a href="http://example.net/">This link</a> has no
title attribute.</p>
  end


end