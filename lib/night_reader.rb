require "./lib/english_converter"

night_reader = File.open(ARGV[0], "r")
braille_text = night_reader.read.strip
night_reader.close

english_converter = EnglishConverter.new
outgoing_text = english_converter.braille_to_english(braille_text.strip)
writer = File.open(ARGV[1], "w")
writer.write(outgoing_text)
writer.close

character_number = outgoing_text.length
puts "Created '#{ARGV[1]}' containing #{character_number} characters."
