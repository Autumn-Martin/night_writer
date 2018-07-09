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

require_relative "./braille_converter"
reader = File.open(ARGV[0], "r")
incoming_text = reader.read
reader.close

braille_converter = BrailleConverter.new
outgoing_text = braille_converter.output_to_file(incoming_text.strip)
writer = File.open(ARGV[1], "w")
writer.write(outgoing_text)
writer.close

character_number = (outgoing_text.length)
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
