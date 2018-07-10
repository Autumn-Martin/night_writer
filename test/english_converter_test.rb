require "minitest/autorun"
require "minitest/pride"
require 'pry'
require "./lib/english_converter"

class EnglishConverterTest < Minitest::Test

  def test_it_exists
    english_converter = EnglishConverter.new

    assert_instance_of EnglishConverter, english_converter
  end

  def test_it_inverts_conversion_map
    english_converter = EnglishConverter.new

    assert_equal "a" ,  english_converter.invert[["0.", "..", ".."]]
  end

  def test_convert_braille_to_plain_text
    input_braille = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    english_converter = EnglishConverter.new

    assert_equal "a", english_converter.convert_braille_to_plain_text([["0.", "..", ".."]])
    assert_equal "abc", english_converter.convert_braille_to_plain_text(input_braille)
  end

  def test_it_outputs_to_file
    skip
    english_converter = EnglishConverter.new
    assert_equal

  end
end
