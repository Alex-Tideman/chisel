require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'renderer'

class TestHeader < Minitest::Test

  def test_header_counts_hashes
    array = ['#','#','#','H','e','a','d','e','r']
    header = Header.new(array)
    assert_equal '3', header.count_hashes
  end

  def test_remove_hashes
    array = ['#','#','#','H','e','a','d','e','r']
    header = Header.new(array)
    assert_equal ['H','e','a','d','e','r'], header.remove_hashes
  end

  def test_adding_header_tags
    array = ['#','#','#','H','e','a','d','e','r']
    header = Header.new(array)
    assert_equal ['<h3>','H','e','a','d','e','r','</h3>'], header.add_header_tag
  end

end

class TestParagraph < Minitest::Test

  def test_adding_paragraph_tag
    array = ['T','e','s','t']
    paragraph = Paragraph.new(array)
    assert_equal ['<p>','T','e','s','t','</p>'], paragraph.add_paragraph_tag
  end

end