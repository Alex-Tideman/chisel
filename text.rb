class Text
  attr_reader :message

  def initialize(message)
    @message = message.split("\n\n")
  end

  def send_chunk
    @message.map do |chunk|
      if chunk[0] == '#'
        Header.new(chunk)
      elsif chunk[0] == (1...9).to_s
        OrderedList.new(chunk)
      elsif chunk[0] == '*'
        UnorderedList.new(chunk)
      else
        Paragraph.new(chunk).get_final
      end
    end
  end
end


class Header

  def initialize(header)
    @header = header
  end

  def count_hashes
    count = 0
    @header.each_char do |char|
      if char == '#'
        count += 1
      end
    end
    count.to_s
  end

  def remove_hashes
    @header.gsub('#','')
  end

  def add_header_tag
    num = count_hashes
    add_front_tag = remove_hashes.insert(0,'<h' + num + '>')
    add_back_tag = add_front_tag.insert(-1,'</h' + num + '>')
  end

end


class Paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def add_paragraph_tag
    @paragraph.insert(0,'<p>')
    @paragraph.insert(-1,'</p>')
  end

  # def get_final
  #   Strong.new(add_paragraph_tag).send_to_em
  # end

end

class OrderedList
  def initialize(list)
    @list = list
  end

  def add_ol_tag
    @list.insert(0, "<ol>")
    @list.insert(-1, "</ol>")
  end

  # def get_final
  #   Lists.new(add_ol_tag).get_other_tags
  # end
end

class UnorderedList
  def initialize(list)
    @list = list
  end

  def get_tags
    Lists.new(@list).get_other_tags
  end

  def add_ul_tag
    add_front_tag = get_tags.insert(0, "<ul>")
    add_end_tag = add_front_tag.insert(-1, "</ul>")
  end


end

