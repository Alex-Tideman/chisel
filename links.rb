class Links
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def find_link
      sentence_chop = @input.split('[')
      link_chop = sentence_chop[1].split("](")
      final_chop = link_chop[1].split(")")
      [sentence_chop[0],link_chop[0],final_chop[0],final_chop[1]]
  end

  def clean_up
    url = find_link[2]
    link = find_link[1]
      if url.include? (" ")
        title_split = url.split(' ')
        title_split[1][0]= " title='"
        title_split[1][-1] = ""
        title_split[0] << "'"
        url = title_split.join
      end
    [url, link]
  end

  def a_href_tag
    "<a href='#{clean_up[0]}'>#{clean_up[1]}</a>"
  end

  def make_string
    [find_link[0],a_href_tag,find_link[-1]].join
  end
end