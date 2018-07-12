require_relative "./braille_converter"

reader = File.open(ARGV[0], "r")
incoming_text = reader.read



reader.close

braille_converter = BrailleConverter.new
outgoing_text = braille_converter.english_to_braille(incoming_text.strip)
writer = File.open(ARGV[1], "w")
  outgoing_text[0].each_index do |i|
    writer.write(outgoing_text[0][i] <<"\n")
    writer.write(outgoing_text[1][i] <<"\n")
    writer.write(outgoing_text[2][i] <<"\n")
end
writer.close

character_number = outgoing_text[0][0].length + outgoing_text[1][0].length + outgoing_text[2][0].length
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
