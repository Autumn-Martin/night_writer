# require 'pry'
# class FileReader
#   def read
#     filename = ARGV[0]
#     File.read(filename)
#   end
# end
#
# class NightWriter
#   attr_reader :file_reader
#
#   def initialize
#     @reader = FileReader.new
#   end
#
#   def convert_file_to_braille
#     plain = reader.read
#     convert_to_braille(plain)
#   end
#
#   def convert_to_braille(input)
#
#   end
#
#   hand
# end

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close
puts incoming_text

braille_text = incoming_text.upcase.reverse
writer = File.open(ARGV[1], "w")
writer.write(braille_text)
writer.close
puts braille_text
