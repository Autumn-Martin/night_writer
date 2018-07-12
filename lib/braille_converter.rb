require "pry"
require_relative "dictionary"

class BrailleConverter
  def initialize
    @braille_output = []
    @dictionary = Dictionary.new
  end

  def english_to_braille(incoming_english)
    convert_english_to_braille(incoming_english)
    @braille_output.map do |element|
     element.join.scan(/.{1,80}/)
    end
  end


  def convert_english_to_braille(incoming_english)
    converted = convert_text_letter_to_braille(incoming_english)
    putting_elements_on_right_level(converted, 0) # top level
    putting_elements_on_right_level(converted, 1) # middle level
    putting_elements_on_right_level(converted, 2) # bottom level
  end

  def convert_text_letter_to_braille(incoming_english)
    incoming_english.chars.map do |letter|
      @dictionary.conversion_map[letter] 
    end
  end

  def putting_elements_on_right_level(converted, level)
    line = []
    converted.each do |character_pair|
      line << character_pair[level]
    end
    @braille_output << line
  end

end
