require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/braille_converter"

class BrailleConverterTest < Minitest::Test
  def test_it_exists
    braille_converter = BrailleConverter.new
    assert_instance_of BrailleConverter, braille_converter
  end

  def test_translates_a_letter
    braille_converter = BrailleConverter.new
    assert_equal "0.....", braille_converter.convert("a")
  end
end
