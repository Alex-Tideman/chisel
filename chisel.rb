require_relative 'text'

class Chisel
  if __FILE__ == $0

    input_doc = File.read(ARGV[0])
    html = Text.new(input_doc).join_message
    output_doc = File.write(ARGV[1],html)
    puts "Converted #{ARGV[0]} to #{ARGV[1]}."
  end
end