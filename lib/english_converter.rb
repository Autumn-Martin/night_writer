require 'pry'
require_relative "dictionary"

class EnglishConverter
  def initialize
    @output = ""
    @dictionary = Dictionary.new
    @inverted_conversion_map = invert
  end

  def invert
    @dictionary.conversion_map.invert#invert conversion_map
  end

  def output_to_file(incoming_braille)
    convert_braille_to_plain_text(incoming_braille)
    @output.map do |element|
      element.join.scan(/.{1,40}/) << "\n"
    end
  end

  def convert_braille_to_plain_text(incoming_braille)
    english_array = incoming_braille.map do |braille|
      @inverted_conversion_map[braille]
    end
    english_array.join
  end

end
