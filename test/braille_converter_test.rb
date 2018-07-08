require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/braille_converter"

class BrailleConverterTest < Minitest::Test
  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end


  def test_it_converts_input_to_braille
    braille_converter = BrailleConverter.new
    actual = braille_converter.convert("a")
    expected = [["0.", "..", ".."]]
    assert_equal expected, actual
  end

  def test_it_puts_elements_in_line_1
    braille_converter = BrailleConverter.new

    expected = ["0."]
    assert_equal expected, braille_converter.putting_elements_in_row_1([["0.", "..", ".."]])
  end

  def test_it_puts_elements_in_row_2
    braille_converter = BrailleConverter.new
    # braille_converter.convert("a")
    expected = [".."]
    assert_equal expected, braille_converter.putting_elements_in_row_2([["0.", "..", ".."]])
  end

  def test_it_puts_elements_in_row_3
    braille_converter = BrailleConverter.new
    # braille_converter.convert("a")
    expected = [".."]
    assert_equal expected, braille_converter.putting_elements_in_row_3([["0.", "..", ".."]])
  end

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  def test_it_can_move_first_two_characters_of_multiple_letters_to_a_new_array
    skip
    nw = NightWriterPlayground.new

    input = [["0.", "..", ".."], ["0.", "0.", ".."]]
    actual = nw.move_braille_letter_element_to_new_array(input)
    expected = ['0.', '0.']

    assert_equal expected, actual
  end

  def test_it_can_move_second_set_of_braille_characters_of_multiple_letters_to_an_array
    skip
    nw = NightWriterPlayground.new

    input = [["0.", "..", ".."]]
    actual = nw.move_second_braille_letter_element_to_new_array(input)
    expected = ['..']

    assert_equal expected, actual
  end

  def test_it_can_translate_two_letters_to_a_braille_letter
    skip
    nw = NightWriterPlayground.new

    actual = nw.convert_plain_text_letter_to_braille_letter("ab")
    expected = [["0.", "..", ".."], ["0.", "0.", ".."]]

    assert_equal expected, actual
  end
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


#######################

  def test_it_puts_two_elements_in_row_1
    braille_converter = BrailleConverter.new
    # braille_converter.convert("a")
    expected = ["0.", "0."]
    input = [["0.", "..", ".."],["0.", "0.", ".."]]
    assert_equal expected, braille_converter.putting_elements_in_row_1(input)
  end



###############################
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  def test_runner
  skip
    nw = NightWriterPlayground.new

    expected = [['0.'], ['..'], ['..']]

    assert_equal expected, nw.runner("a")
  end
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end
