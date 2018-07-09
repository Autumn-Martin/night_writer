require "pry"

class BrailleConverter
  def initialize
    # zero = raised dot & period = space
    @conversion_map = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }

    @output = []
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
      @conversion_map[letter]
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
