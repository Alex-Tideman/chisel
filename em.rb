class Em

  def initialize(input)
    @input = input.split("")
  end

  def em_tag
    count = 0
    @input.map do |char|
      if char == '*'
        if count.even?
          count += 1
          '<em>'
        else
        count += 1
          '</em>'
        end
      else
        char
      end
    end
  end

  def make_string
    em_tag.join
  end

end
