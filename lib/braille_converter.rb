require "pry"
require_relative "dictionary"

class BrailleConverter
  def initialize
    @braille_output = []
    @dictionary = Dictionary.new
  end

  def english_to_braille(incoming_english_text)
    convert_english_to_braille(incoming_english_text)
    @braille_output.map do |element|
     element.join.scan(/.{1,80}/) #array -join-> string ->scan -> arrays
    end
  end
  # scan can only works on strings, and returns arrays

  def convert_english_to_braille(incoming_english_text) #runner method - calling all the methods within
    converted = convert_text_letter_to_braille(incoming_english_text)
    putting_elements_on_right_level(converted, 0) # top level
    putting_elements_on_right_level(converted, 1) # middle level
    putting_elements_on_right_level(converted, 2) # bottom level
  end

  def convert_text_letter_to_braille(incoming_english_text)
    incoming_english_text.chars.map do |letter| #chars will breakup the text into and array of individual letters
      @dictionary.conversion_map[letter] #letter = key, so accessing the value of key (returning the key's value = braille)
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
