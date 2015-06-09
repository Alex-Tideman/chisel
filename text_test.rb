require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'renderer'

class TestText < Minitest::Test

  def test_add_em_tag
    chunk = ['<p>','T','e','s','t',' ','*','i','t','a','l','i','c','s','*','</p>']
    array = Text.new(chunk)
    assert_equal ['<p>','T','e','s','t',' ','<em>','i','t','a','l','i','c','s','</em>','</p>'], array.em_tag
  end

  def test_multiple_em_tags
    chunk = ['<p>','*','o','n','e','*',' ','*','t','w','o','*','</p>']
    array = Text.new(chunk)
    assert_equal ['<p>','<em>','o','n','e','</em>',' ','<em>','t','w','o','</em>','</p>'], array.em_tag
  end

  def test_add_strong_tag
    chunk = ['<p>','T','e','s','t','*','*','s','t','r','o','n','g','*','*','</p>']
    array = Text.new(chunk)
    assert_equal ['<p>','T','e','s','t',' ','<em>','i','t','a','l','i','c','s','</em>','</p>'], array.em_tag
  end




end