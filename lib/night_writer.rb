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

# require "pry"; binding.pry

reader.close

braille_converter = BrailleConverter.new
outgoing_text = braille_converter.english_to_braille(incoming_text.strip)
writer = File.open(ARGV[1], "w")
  outgoing_text[0].each_index do |i|
    # require "pry"; binding.pry
    writer.write(outgoing_text[0][i] <<"\n")
    writer.write(outgoing_text[1][i] <<"\n")
    writer.write(outgoing_text[2][i] <<"\n")
end
writer.close

character_number = outgoing_text[0][0].length + outgoing_text[1][0].length + outgoing_text[2][0].length
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
