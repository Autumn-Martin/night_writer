require_relative "dictionary"

class EnglishConverter
  def initialize
    @dictionary = Dictionary.new
  end

  def braille_to_english(incoming_braille_text)
    split = split_incoming_message(incoming_braille_text)
    sliced = slice_message(split)
    scanned = find_characters(sliced)
    combined = combine_braille_characters(scanned)
    convert_braille_letters_to_english_letters(combined)
  end

  def split_incoming_message(incoming_braille_text)
    incoming_braille_text.split
  end

  def slice_message(split)
    split.each_slice(3).map do |line|
      line
    end # returns an array with elements: top level, middle level, & bottom level
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
    braille_words = braille_letter.flatten(1) # flatten un-nests: [[["0.", "..", ".."]["0.", "..", ".."]]] -> [["0.", "..", ".."]["0.", "..", ".."]]
      braille_words.map do |braille_letter|
        @dictionary.conversion_map.key(braille_letter)
    end.join
  end

end
