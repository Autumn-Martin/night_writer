require 'pry'
require_relative "dictionary"

class EnglishConverter
  def initialize
    @output = ""
    @dictionary = Dictionary.new
  end


  # @dictionary.conversion_map.key(braille) # gives access to the keys (letter) based on knowlege of the value (braille)
  # take what's written on braille.txt, read it, & compare it to our dictionary
  def from_file(file_name)
    file = File.open(file_name, "r")
    braille_message = file.read

    braille_to_english(braille_message)
  end

  def braille_to_english(braille_message)
    binding.pry
    braille_array = braille_message.chars
    letters = braille_array.map do |character|
      @dictionary.conversion_map.key(character)
    end
  end

  def reformat(braille_message)
    split = braille_message.split
    split.map do |element|
      split[0][0..1] + split[0+1][0..1]
    end
  end
end
