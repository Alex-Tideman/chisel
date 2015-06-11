require './lib/lists'
require './lib/strong'


class Text
  attr_reader :message

  def initialize(message)
    @message = message.split("\n\n")
  end

  def send_chunk
    @message.map do |chunk|
      if chunk[0] == '#'
        Header.new(chunk).add_header_tag
      elsif chunk[0].to_i > 0
        OrderedList.new(chunk).add_ol_tag
      elsif chunk[0] == '*'
        UnorderedList.new(chunk).add_ul_tag
      else
        Paragraph.new(chunk).add_p_tag
      end
    end
  end

  def join_message
    send_chunk.join
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
    hashes_gone = @header.gsub!('#','')
  end

  def get_tag
    Strong.new(remove_hashes).send_to_em
  end

  def add_header_tag
    num = count_hashes
    add_front_tag = get_tag.insert(0,"<h#{num}>").sub(' ','')
    add_end_tag = add_front_tag.insert(-1,"</h#{num}>\n\n")
  end
end

class Paragraph
  def initialize(paragraph)
    @paragraph = paragraph
  end

  def get_tags
    Strong.new(@paragraph).send_to_em
  end

  def add_tabs
    get_tags.split("\n").map do |line|
      line.insert(0,"\t")
      line.insert(-1,"\n")
    end
  end

  def add_p_tag
    add_front_tag = add_tabs.join.insert(0,"<p>\n")
    add_end_tag = add_front_tag.insert(-1,"</p>\n\n")
  end
end

class OrderedList
  def initialize(list)
    @list = list
  end

  def get_tags
    Lists.new(@list).get_other_tags
  end

  def add_ol_tag
    add_front_tag = get_tags.insert(0, "<ol>\n")
    add_end_tag = add_front_tag.insert(-1, "</ol>\n\n")
  end
end

class UnorderedList
  def initialize(list)
    @list = list
  end

  def get_tags
    Lists.new(@list).get_other_tags
  end

  def add_ul_tag
    add_front_tag = get_tags.insert(0, "<ul>\n")
    add_end_tag = add_front_tag.insert(-1, "</ul>\n\n")
  end
end

