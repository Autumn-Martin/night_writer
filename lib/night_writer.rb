require_relative "./braille_converter"


english_input_file = File.open(ARGV[0], "r") # opening file & reading it
incoming_english_text = english_input_file.read
english_input_file.close

braille_converter = BrailleConverter.new
outgoing_braille_text = braille_converter.english_to_braille(incoming_english_text.strip)
braille_writer = File.open(ARGV[1], "w")
  outgoing_braille_text[0].each_index do |i| # adds a new line at the end of each level 
    braille_writer.write(outgoing_braille_text[0][i] <<"\n")
    braille_writer.write(outgoing_braille_text[1][i] <<"\n")
    braille_writer.write(outgoing_braille_text[2][i] <<"\n")
end
braille_writer.close

character_number = outgoing_braille_text[0][0].length + outgoing_braille_text[1][0].length + outgoing_braille_text[2][0].length
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
