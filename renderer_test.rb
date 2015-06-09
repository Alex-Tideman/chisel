require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'renderer'

class TestRenderer < Minitest::Test

  def test_text_splits_at_blank_space
    text = "This is the first message.\nThis is still part of that block.\n\n#New Header\n\n"
    text_array = Renderer.new(text)
    assert_equal ["This is the first message.\nThis is still part of that block.","#New Header"], text_array.message
  end

  def test_split_text_goes_to_correct_renderer
    text = "Test.\nSame chunk.\n\n###New Header\n\n"
    text_array = Renderer.new(text).render_message

    assert_equal ["<p>","T","e","s","t",".","\n","S","a","m","e"," ","c","h","u","n","k",".","</p>"], text_array[0].add_paragraph_tag
    assert_equal ["<h3>","N","e","w"," ","H","e","a","d","e","r","</h3>"], text_array[1].add_header_tag
  end

end