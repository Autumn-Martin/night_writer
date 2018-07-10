require "pry"
require_relative "dictionary"

class BrailleConverter
  def initialize
    @output = []
    @dictionary = Dictionary.new
  end

  def output_to_file(incoming_text)
    convert_plain_text_to_braille(incoming_text)
    @output.map do |element|
     element.join.scan(/.{1,80}/) << "\n"
   end
  end

  def convert_plain_text_to_braille(incoming_text)
    converted = convert(incoming_text)
    putting_elements_in_row_1(converted)
    putting_elements_in_row_2(converted)
    putting_elements_in_row_3(converted)
  end

  def convert(input)
    converted = input.chars.map do |letter|
      @dictionary.conversion_map[letter]
    end
  end

  def putting_elements_in_row_1(converted)
    line_1 = []
    converted.each do |char_1|
      line_1 << char_1[0]
    end
    @output << line_1
  end

  def putting_elements_in_row_2(converted)
    line_2 = []
    converted.each do |char_2|
      line_2 << char_2[1]
    end
    @output << line_2
  end

  def putting_elements_in_row_3(converted)
    line_3 = []
    converted.each do |char_3|
      line_3 << char_3[2]
    end
    @output << line_3
  end
end
