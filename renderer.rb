
class Renderer
  attr_reader :message

  def initialize(message)
    @message = message.split("\n\n")
  end

  def render_message
    @message.map do |chunk|
      if chunk[0] == '#'
        Header.new(chunk.split(""))
      else
        Paragraph.new(chunk.split(""))
      end
    end
  end
end


class Header
  attr_reader :header

  def initialize(header)
    @header = header
  end

  def count_hashes
    count = 0
    @header.each do |char|
      if char == '#'
        count += 1
      end
    end
    count.to_s
  end

  def remove_hashes
    @header.delete_if { |char| char == '#' }
  end

  def add_header_tag
    num = count_hashes
    remove_hashes.unshift('<h' + num + '>').push('</h' + num + '>')
  end

end


class Paragraph
  def initialize(paragraph)
    @paragraph = paragraph
  end

  def add_paragraph_tag
    @paragraph.unshift('<p>').push('</p>')
  end

end

class Text
  def initialize(chunk)
    @chunk = chunk
  end

  def em_tag
    count = 0
    @chunk.map do |char|
      if char == '*'
        if count.even?
          count += 1
          char = '<em>'
        elsif
          count += 1
          char = '</em>'
        end
      else
        char
      end
    end
  end


  def strong_tag
    count = 0
    @chunk.map do |char|
      if char && (char + 1) == '*'
        if count.even?
          count += 1
          char = '<strong>'
        elsif
          count += 1
          char = '</strong>'
        end
      else
        char
      end
    end
  end

  def lists

  end

end





