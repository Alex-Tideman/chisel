require 'minitest/autorun'
require 'minitest/pride'
# require_relative '../lib/renderer'
require_relative 'em'
require_relative 'strong'
require_relative 'text'
require_relative 'lists'

class TestHeader < Minitest::Test

  def test_header_counts_hashes
    input = '### Header'
    output = Header.new(input)
    assert_equal '3', output.count_hashes
  end

  def test_remove_hashes
    input = '### Header'
    expected = ' Header'
    output = Header.new(input)
    assert_equal expected, output.remove_hashes
  end

  def test_get_other_tags
    input = "## This is a **bold** header with *dinosaurs*"
    expected = " This is a <strong>bold</strong> header with <em>dinosaurs</em>"
    output = Header.new(input)
    assert_equal expected, output.get_tag
  end

  def test_add_header_tag
    input = "### This is a **bold** header with *dinosaurs*"
    expected = "<h3>This is a <strong>bold</strong> header with <em>dinosaurs</em></h3>\n\n"
    output = Header.new(input)
    assert_equal expected, output.add_header_tag
  end

end

class TestParagraph < Minitest::Test

  def test_get_other_tags
    input = "This *is normal* **text**. Could be many sentences."
    expected = "This <em>is normal</em> <strong>text</strong>. Could be many sentences."
    output = Paragraph.new(input)
    assert_equal expected, output.get_tags
  end

  def test_add_p_tag
    input = "This *is normal* text.\nCould be many sentences."
    expected = "<p>\n\tThis <em>is normal</em> text.\n\tCould be many sentences.\n</p>\n\n"
    output = Paragraph.new(input)
    assert_equal expected, output.add_p_tag
  end

end

class TestOrderedList < Minitest::Test

  def test_get_li_tags_for_ordered_list
    input = "1. one\n2. two\n3. three\n4. four\n5. five"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = OrderedList.new(input)
    assert_equal expected, output.get_tags
  end

  def test_get_li_tags_and_other_tags
    input = "1. **one**\n2. two\n3. three\n4. *four*\n5. five"
    expected = "\t<li><strong>one</strong></li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li><em>four</em></li>\n\t<li>five</li>\n"
    output = OrderedList.new(input)
    assert_equal expected, output.get_tags
  end

  def test_add_ol_tag
    input = "1. one\n2. two\n3. three\n4. *four*\n5. five"
    expected = "<ol>\n\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li><em>four</em></li>\n\t<li>five</li>\n</ol>\n\n"
    output = OrderedList.new(input)
    assert_equal expected, output.add_ol_tag
  end

end

class TestUnorderedList < Minitest::Test

  def test_get_li_tags_for_unordered_list
    input = "* one\n* two\n* three\n* four\n* five"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li>five</li>\n"
    output = UnorderedList.new(input)
    assert_equal expected, output.get_tags
  end

  def test_get_li_tags_and_other_tags
    input = "* one\n* two\n* *three*\n* four\n* **five**"
    expected = "\t<li>one</li>\n\t<li>two</li>\n\t<li><em>three</em></li>\n\t<li>four</li>\n\t<li><strong>five</strong></li>\n"
    output = UnorderedList.new(input)
    assert_equal expected, output.get_tags
  end

  def test_add_ul_tag
    input = "* one\n* two\n* three\n* four\n* **five**"
    expected = "<ul>\n\t<li>one</li>\n\t<li>two</li>\n\t<li>three</li>\n\t<li>four</li>\n\t<li><strong>five</strong></li>\n</ul>\n\n"
    output = UnorderedList.new(input)
    assert_equal expected, output.add_ul_tag
  end



end