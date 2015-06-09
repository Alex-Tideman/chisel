class Chisel

  def initialize(message = nil, output = nil)
    @message = message
    @output_file = output
  end



#   def file_reader
#     message_file = File.open(@message, "r")
#     parsed = Parser.new(message_file.readline.split(""))
#     file_writer(parsed)
#     message_file.close
#   end
#
#   def file_writer(parsed)
#     html = File.open(@output_file, "w")
#     html.write(parsed)
#   end
# end
#
# class Runner
#   if __FILE__ == $0
#     file_exists = File.exist?(ARGV[1])
#     if file_exists
#       puts "Are you sure you want to overwrite your file?"
#       answer = $stdin.gets.chomp
#       if answer == 'n'
#         abort("You exited.")
#       else answer == 'y'
#       encrypt = Encrypt.new(ARGV[0], ARGV[1])
#       encrypt.file_reader
#       puts "Rewrote #{ARGV[1]}."
#       end
#     else
#       encrypt = Encrypt.new(ARGV[0], ARGV[1])
#       encrypt.file_reader
#       puts "Created #{ARGV[1]}."
#     end
#   end
# end
