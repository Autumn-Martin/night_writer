require_relative "dictionary"

class EnglishConverter
  def initialize
    @dictionary = Dictionary.new
  end


  def braille_to_english(incoming_text)
    split = split_incoming_message(incoming_text)
    sliced = slice_message(split)
    scanned = find_characters(sliced)
    combined = combine_braille_characters(scanned)
    convert_braille_letters_to_english_letters(combined)
  end

  def split_incoming_message(incoming_text)
    incoming_text.split
  end

  def slice_message(split)
    split.each_slice(3).map do |line|
      line
    end
  end

  def find_characters(sliced)
    sliced.map do |slice|
      slice.map {|line| line.scan(/../)}
    end
  end

  def combine_braille_characters(scanned)
    braille_letter = []
    scanned.map.with_index do |braille, index|
      braille_char = braille[0].zip(braille[1], braille[2])
      braille_letter << braille_char
    end
    braille_letter
  end

  def convert_braille_letters_to_english_letters(braille_letter)
    braille_words = braille_letter.flatten(1)
      braille_words.map do |letter|
        @dictionary.conversion_map.invert[letter]
    end.join
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
