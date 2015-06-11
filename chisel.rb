require './lib/text'

class Chisel
  if __FILE__ == $0
    input_doc = File.read(ARGV[0])
    html = Text.new(input_doc).join_message
    output_doc = File.write(ARGV[1],html)
    count1 = File.foreach(ARGV[0]).count
    count2 = File.foreach(ARGV[1]).count
    puts "Converted #{ARGV[0]} (#{count1} lines) to #{ARGV[1]} (#{count2} lines)"
  end
end