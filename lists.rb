require_relative 'em'
require_relative 'strong'

class Lists
  attr_reader :input

  def initialize(input)
    @input = input.split('\n')
  end

  def lists
    split_by_newline = @input
    split_by_newline.map do |line|
      li_tag(line)
    end
  end

  def li_tag(line)
    if line[0] == '*'
      line.gsub!(/\*./, '<li>')
      line.insert(-1,'</li>\n')
    elsif line[0] =~ (/\d/)
      line.gsub!(/\d../, '<li>')
      line.insert(-1,'</li>\n')
    else
      line
    end
  end

  def make_string
    lists.join
  end

  def get_other_tags
    Strong.new(make_string).send_to_em
  end

end

