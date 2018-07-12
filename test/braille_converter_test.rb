require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end

  def test_it_converts_input_to_braille
    braille_converter = BrailleConverter.new

    expected_a = [["0.", "..", ".."]]
    expected_z = [["0.", ".0", "00"]]
    actual_a = braille_converter.convert_text_letter_to_braille("a")
    actual_z = braille_converter.convert_text_letter_to_braille("z")

    assert_equal expected_a, actual_a
    assert_equal expected_z, actual_z
  end

  def test_it_moves_first_element_of_single_braille_letter_to_top_line
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]
    expected = [["0."]]
    actual = braille_converter.putting_elements_on_right_level(converted, 0)

    assert_equal expected, actual
  end

  def test_it_moves_second_element_of_single_braille_letter_to_middle_level
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]
    expected = [[".0"]]
    actual = braille_converter.putting_elements_on_right_level(converted, 1)

    assert_equal expected, actual
  end

  def test_it_moves_third_element_of_single_braille_letter_to_bottom_level
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]
    expected = [["00"]]
    actual = braille_converter.putting_elements_on_right_level(converted, 2)

    assert_equal expected, actual
  end

  def test_it_can_translate_two_letters_to_braille
    braille_converter = BrailleConverter.new

    expected = [["0.", "..", ".."], ["0.", "0.", ".."]]
    actual = braille_converter.convert_text_letter_to_braille("ab")

    assert_equal expected, actual
  end

  def test_it_puts_top_character_pair_on_top_level
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]
    expected = [['0.', '0.']]
    actual = braille_converter.putting_elements_on_right_level(converted, 0)

    assert_equal expected, actual
  end

  def test_it_puts_middle_character_pair_on_middle_level
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]
    expected = [['..', '0.']]
    actual = braille_converter.putting_elements_on_right_level(converted, 1)

    assert_equal expected, actual
  end

  def test_it_puts_bottom_character_pair_on_bottom_level
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]
    expected = [["..", ".."]]
    actual = braille_converter.putting_elements_on_right_level(converted, 2)

    assert_equal expected, actual
  end


  def test_it_can_convert_multiple_braille_letters_to_braille
    braille_converter = BrailleConverter.new

    expected = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"],
    ["..", "..", "0.", "0.", "0."]]
    actual = braille_converter.convert_english_to_braille("hello")

    assert_equal expected, actual
  end
end
