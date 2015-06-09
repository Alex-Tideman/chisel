class Strikethrough

  def parse(input)
    removed = input.tr('~~', '')
    removed.insert(-1, "</del>")
    removed.insert(0, "<del>")
  end

end