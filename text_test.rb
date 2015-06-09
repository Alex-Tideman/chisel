require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'em'
require_relative 'strong'
require_relative 'text'
require_relative 'lists'

class TestHeader < Minitest::Test

  def test_header_counts_hashes
    input = '###Header'
    output = Header.new(input)
    assert_equal '3', output.count_hashes
  end

  def test_remove_hashes
    input = '###Header'
    expected = 'Header'
    output = Header.new(input)
    assert_equal expected, output.remove_hashes
  end

  def test_adding_header_tags
    input = '###Header'
    expected = '<h3>Header</h3>'
    output = Header.new(input)
    assert_equal expected, output.add_header_tag
  end

end

class TestParagraph < Minitest::Test

  def test_adding_paragraph_tag
    input = 'This is normal text. Could be many sentences.'
    expected = '<p>This is normal text. Could be many sentences.</p>'
    output = Paragraph.new(input)
    assert_equal expected, output.add_paragraph_tag
  end

end

class TestOrderedList < Minitest::Test

  def test_adding_ol_tag
    input = '1. one\n2. two\n3. three\n4. four\n5. five'
    expected = '<ol>1. one\n2. two\n3. three\n4. four\n5. five</ol>'
    output = OrderedList.new(input)
    assert_equal expected, output.add_ol_tag
  end

end

class TestUnorderedList < Minitest::Test

  def test_get_li_tags
    input = '* one\n* two\n* three\n* four\n* five'
    expected = '<li>one</li>\n<li>two</li>\n<li>three</li>\n<li>four</li>\n<li>five</li>\n'
    output = UnorderedList.new(input)
    assert_equal expected, output.get_tags
  end

  def test_add_ul_tag
    input = '* one\n* two\n* three\n* four\n* five'
    expected = '<ul><li>one</li>\n<li>two</li>\n<li>three</li>\n<li>four</li>\n<li>five</li>\n</ul>'
    output = UnorderedList.new(input)
    assert_equal expected, output.add_ul_tag
  end

  # def test_getting_the_rest_of_the_tags
  #   input = '* one\n* two\n* *three*\n* four\n* **five**'
  #   expected = '<ul><li>one</li>\n<li>two</li>\n<li><em>three</em></li>\n<li>four</li>\n<li><strong>five</strong></li></ul>'
  #   output = UnorderedList.new(input)
  #   assert_equal expected, output.get_final
  # end

end