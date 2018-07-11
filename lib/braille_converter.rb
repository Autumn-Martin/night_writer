require "pry"
require_relative "dictionary"

class BrailleConverter
  def initialize
    @output = []
    @dictionary = Dictionary.new
  end

  def english_to_braille(incoming_text)
    convert_plain_text_to_braille(incoming_text)
    @output.map do |element|
     element.join.scan(/.{1,80}/)
   end
  end

  def convert_plain_text_to_braille(incoming_text)
    converted = convert_text_letter_to_braille(incoming_text)
    putting_elements_on_right_level(converted, 0)
    putting_elements_on_right_level(converted, 1)
    putting_elements_on_right_level(converted, 2)
  end

  def convert_text_letter_to_braille(input)
    converted = input.chars.map do |letter|
      @dictionary.conversion_map[letter]
    end
  end

  def putting_elements_on_right_level(converted, level)
    line = []
    converted.each do |character_pair|
      line << character_pair[level]
    end
    @output << line
  end

end
