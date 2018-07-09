require "./lib/english_converter"

reader = File.open(ARGV[0], "r")
incoming_text = reader.read
reader.close

english_converter = EnglishConverter.new
outgoing_text = english_converter.output_to_file(incoming_text.strip)
writer = File.open(ARGV[1], "w")
#   outgoing_text[0].each_index do |i|
#     writer.write(outgoing_text[0][i] <<"\n")
#     writer.write(outgoing_text[1][i] <<"\n")
#     writer.write(outgoing_text[2][i] <<"\n")
# end
writer.write(outgoing_text)
writer.close

character_number = outgoing_text.length
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
