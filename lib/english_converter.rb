require_relative "dictionary"

class EnglishConverter
  def initialize
    @dictionary = Dictionary.new
  end

  def braille_to_english(incoming_braille_text) #runner method
    split = split_incoming_message(incoming_braille_text)
    sliced = slice_message(split)
    scanned = find_characters(sliced)
    combined = combine_braille_characters(scanned)
    convert_braille_letters_to_english_letters(combined)
  end

  def split_incoming_message(incoming_braille_text) #splits out elements at the new line and puts them into a single array
    incoming_braille_text.split # could be any number of elements
  end

  def slice_message(split)
    split.each_slice(3).map do |line|
      line # specifies an exact number (puts exactly 3 elements in an array)
    end # returns an array with elements: top level, middle level, & bottom level
  end

  def find_characters(sliced)
    sliced.map do |slice|
      slice.map {|line| line.scan(/../)}
    end
  end

  def combine_braille_characters(scanned) # look at test file: .zip zips the 2 arguments.
    braille_letter = []
    scanned.map.with_index do |braille, index|
      braille_char = braille[0].zip(braille[1], braille[2])
      braille_letter << braille_char
    end
    braille_letter
  end
  # takes the first element of array one, and adds the first element of array 2, then adds the first element of array 3,

  def convert_braille_letters_to_english_letters(braille_letter)
    braille_words = braille_letter.flatten(1) # flatten removes one level of array nesting # un-nester [[["0.", "..", ".."]["0.", "..", ".."]]] -> [["0.", "..", ".."]["0.", "..", ".."]]
      braille_words.map do |braille_letter|
        @dictionary.conversion_map.key(braille_letter) #accessing the key with the argument of value
    end.join
  end

  # @dictionary.conversion_map.key(braille) # gives access to the keys (letter) based on knowlege of the value (braille)
  # take what's written on braille.txt, read it, & compare it to our dictionary


end
