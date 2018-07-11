require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end

  def test_it_converts_input_to_braille
    # skip
    braille_converter = BrailleConverter.new

    expected = [["0.", "..", ".."]]
    assert_equal expected, braille_converter.convert_text_letter_to_braille("a")

    expected = [["0.", ".0", "00"]]
    assert_equal expected, braille_converter.convert_text_letter_to_braille("z")
  end

  def test_it_moves_first_element_of_single_braille_letter_to_line_1
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]

    expected = [["0."]]
    actual = braille_converter.putting_elements_in_row_1(converted)

    assert_equal expected, actual
  end

  def test_it_moves_second_element_of_single_braille_letter_to_line_2
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]

    expected = [[".0"]]

    assert_equal expected, braille_converter.putting_elements_in_row_2(converted)
  end

  def test_it_moves_third_element_of_single_braille_letter_to_line_3
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", ".0", "00"]]

    expected = [["00"]]
    actual = braille_converter.putting_elements_in_row_3(converted)

    assert_equal expected, actual
  end

  def test_it_can_translate_two_letters_to_braille
    # skip
    braille_converter = BrailleConverter.new

    expected = [["0.", "..", ".."], ["0.", "0.", ".."]]

    assert_equal expected, braille_converter.convert_text_letter_to_braille("ab")
  end

  def test_it_can_put_first_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]

    expected = [['0.', '0.']]
    actual = braille_converter.putting_elements_in_row_1(converted)

    assert_equal expected, actual
  end

  def test_it_can_put_second_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]

    expected = [['..', '0.']]
    actual = braille_converter.putting_elements_in_row_2(converted)

    assert_equal expected, actual
  end

  def test_it_can_put_third_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = [["0.", "..", ".."], ["0.", "0.", ".."]]

    expected = [["..", ".."]]
    actual = braille_converter.putting_elements_in_row_3(converted)

    assert_equal expected, actual
  end

  def test_it_can_convert_multiple_braille_letters_to_braille
    # skip#
    braille_converter = BrailleConverter.new

    expected = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]
    actual = braille_converter.convert_plain_text_to_braille("hello")

    assert_equal expected, actual
  end
end
