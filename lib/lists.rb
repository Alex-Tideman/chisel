require './lib/strong'

class Lists
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def lists
    split_by_newline = @input
    split_by_newline.map do |line|
      li_tag(line)
    end
  end

  def li_tag(line)
    if line[0] == '*'
      line.slice!(0..1)
      line.insert(0,"\t<li>")
      line.insert(-1,"</li>\n")
    else
      line.slice!(0..2)
      line.insert(0,"\t<li>")
      line.insert(-1,"</li>\n")
    end
  end

  def make_string
    lists.join
  end

  def get_other_tags
    Strong.new(make_string).send_to_em
  end

end
