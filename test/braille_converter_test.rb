require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/braille_converter"
require "./lib/dictionary"

class BrailleConverterTest < Minitest::Test

  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end


  def test_it_converts_input_to_braille
    braille_converter = BrailleConverter.new

    expected = [["0.", "..", ".."]]
    assert_equal expected, braille_converter.convert("a")

    expected = [["0.", ".0", "00"]]
    assert_equal expected, braille_converter.convert("z")
  end

  def test_it_moves_first_element_of_single_braille_letter_in_line_1
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("a")

    expected = [["0."]]
    actual = braille_converter.putting_elements_in_row_1(converted)

    assert_equal expected, actual
  end

  def test_it_moves_first_elements_of_a_different_letter_in_line_1
    # skip
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("z")

    expected = [["0."]]
    actual = braille_converter.putting_elements_in_row_1(converted)
    assert_equal expected, actual
  end

  def test_it_moves_first_element_of_single_braille_letter_in_line_2
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("a")

    expected = [[".."]]
    actual = braille_converter.putting_elements_in_row_2(converted)

    assert_equal expected, actual
  end

  def test_it_moves_first_elements_of_a_different_letter_in_line_2
    # skip
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("z")

    expected = [[".0"]]
    actual = braille_converter.putting_elements_in_row_2(converted)

    assert_equal expected, actual
  end

  def test_it_moves_first_element_of_single_braille_letter_in_line_3
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("a")

    expected = [[".."]]
    actual = braille_converter.putting_elements_in_row_3(converted)

    assert_equal expected, actual
  end

  def test_it_moves_first_elements_of_a_different_letter_in_line_3
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("z")

    expected = [["00"]]
    actual = braille_converter.putting_elements_in_row_3(converted)

    assert_equal expected, actual
  end
# ----------------BEGIN MULTIPLE LETTER TESTS-----------------------------
  def test_it_can_translate_two_letters_to_braille
    # skip
    braille_converter = BrailleConverter.new

    expected = [["0.", "..", ".."], ["0.", "0.", ".."]]

    assert_equal expected, braille_converter.convert("ab")
  end

  def test_it_can_put_first_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("ab")

    expected = [['0.', '0.']]
    actual = braille_converter.putting_elements_in_row_1(converted)

    assert_equal expected, actual
  end

  def test_it_can_put_second_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("ab")

    expected = [['..', '0.']]
    actual = braille_converter.putting_elements_in_row_2(converted)

    assert_equal expected, actual
  end

  def test_it_can_put_third_elements_of_multiple_braille_letters_in_new_array
    # skip
    braille_converter = BrailleConverter.new

    converted = braille_converter.convert("ab")

    expected = [["..", ".."]]
    actual = braille_converter.putting_elements_in_row_3(converted)

    assert_equal expected, actual
  end
# ------------------END MULTIPLE LETTER TESTS--------------------------------

# ------------------BEGIN INTEGRATION TESTS----------------------------------
  def test_it_converts_a_plain_text_letter_to_braille
  # skip
    braille_converter = BrailleConverter.new

    expected = [['0.'], ['..'], ['..']]
    actual = braille_converter.convert_plain_text_to_braille("a")

    assert_equal expected, actual
  end

  def test_it_can_convert_multiple_plain_text_letters_to_braille
  # skip
    braille_converter = BrailleConverter.new

    expected = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]
    actual = braille_converter.convert_plain_text_to_braille("hello")

    assert_equal expected, actual
  end
  # ------------------END INTEGRATION TESTS-----------------------------------
end
