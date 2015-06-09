class TestIntegration < Minitest::Test

  def test_hash_is_sent_to_header
    skip
    input = '###This is a H3 Header'
    output = Text.new(input)
    assert_equal Header.new(input), output.send_to_header_or_paragraph
  end

  def test_non_hash_is_sent_to_paragraph
    skip
    input = 'This is normal text. Could be many sentences.'
    output = Text.new(input)
    assert_equal Paragraph.new(input), output.send_to_header_or_paragraph
  end
end