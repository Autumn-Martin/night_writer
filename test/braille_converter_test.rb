require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/braille_converter"

class BrailleConverterTest < Minitest::Test
  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end

  # def test_translates_a_letter
  #   braille_converter = BrailleConverter.new
  #   # assert_equal "0.....", braille_converter.convert("a")
  #   result =
  #   [[["0", "."],
  #   [".", "."],
  #   [".", "."]]]
  #
  #   braille_converter.print_to_terminal(result)
  #   assert_equal result, braille_converter.convert("ab")
  # end

  def test_it_converts_input_to_braille
    braille_converter = BrailleConverter.new
    actual = braille_converter.convert("a")
    expected = [["0.", "..", ".."]]
    assert_equal expected, actual
  end

  def test_it_puts_elements_in_row_1
      braille_converter = BrailleConverter.new
      # braille_converter.convert("a")
      expected = ["0."]
      assert_equal expected, braille_converter.putting_elements_in_row_1([["0.", "..", ".."]])
  end

  def test_it_puts_elements_in_row_2
      braille_converter = BrailleConverter.new
      # braille_converter.convert("a")
      expected = [".."]
      assert_equal expected, braille_converter.putting_elements_in_row_2([["0.", "..", ".."]])
  end
end
