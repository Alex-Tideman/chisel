require './lib/em'

class Strong

  def initialize(input)
    @input = input
    @input.gsub!('**','$')
  end


  def em_tag
    count = 0
    @input.split("").map do |char|
      if char == '$'
        if count.even?
          count += 1
          '<strong>'
        else
          count += 1
          '</strong>'
        end
      else
        char
      end
    end
  end

  def make_string
    em_tag.join
  end

  def send_to_em
    Em.new(make_string).send_to_links
  end

end


