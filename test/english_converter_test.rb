require "minitest/autorun"
require "minitest/pride"
require "./lib/english_converter"

class EnglishConverterTest < Minitest::Test

  def test_it_exists
    english_converter = EnglishConverter.new

    assert_instance_of EnglishConverter, english_converter
  end


  def test_it_can_split_incoming_english_text_into_an_array
    english_converter = EnglishConverter.new

    incoming_text = "0.0.0.0.0.\n..........\n..........\n0.0.0.0.0.\n..........\n..........\n"

    expected = ["0.0.0.0.0.","..........","..........","0.0.0.0.0.","..........",".........."]

    assert_equal expected, english_converter.split_incoming_message(incoming_text)
  end

  def test_it_can_slice_incoming_text_array_into_equal_arrays
    # skip
    english_converter = EnglishConverter.new

    split = ["0.0.0.0.0.","..........","..........","0.0.0.0.0.",
      "..........",".........."]

    expected = ["0.0.0.0.0.","..........",".........."],
    ["0.0.0.0.0.","..........",".........."]

    assert_equal expected, english_converter.slice_message(split)
  end

  def test_it_can_split_sliced_array_elements_to_two_character_strings
    english_converter = EnglishConverter.new

    sliced = [["0.0.0.0.0.","..........",".........."],
    ["0.0.0.0.0.","..........",".........."]]

    expected = [[["0.","0.","0.", "0.", "0."], ["..","..","..","..",".."],
    ["..","..","..","..",".."]], [["0.","0.","0.", "0.", "0."],
    ["..","..","..","..",".."], ["..","..","..","..",".."]]]

    assert_equal expected, english_converter.find_characters(sliced)
  end

  def test_it_can_move_braille_character_pairs_from_each_array_to_new_array
    english_converter = EnglishConverter.new

    scanned = [[["0.","0.","0.", "0.", "0."], ["..","..","..","..",".."],
    ["..","..","..","..",".."]], [["00","00","00", "00", "00"],
    ["00","00","00","00","00"], ["0.","0.","0.","0.","0."]]]
    # "a" * 5, "q" * 5

    expected = [[["0.", "..", ".."], ["0.", "..", ".."], ["0.", "..", ".."],
    ["0.", "..", ".."], ["0.", "..", ".."]], [["00", "00", "0."],
    ["00", "00", "0."], ["00", "00", "0."], ["00", "00", "0."],
    ["00", "00", "0."]]]

    assert_equal expected, english_converter.combine_braille_characters(scanned)
  end

  def test_it_can_translate_braille_to_english
    english_converter = EnglishConverter.new
    input = [[["0.", "..", ".."], ["0.", "..", ".."], ["0.", "..", ".."],
    ["0.", "..", ".."], ["0.", "..", ".."]], [["00", "00", "0."],
    ["00", "00", "0."], ["00", "00", "0."], ["00", "00", "0."],
    ["00", "00", "0."]]]

    assert_equal "aaaaaqqqqq", english_converter.convert_braille_letters_to_english_letters(input)
  end

end
