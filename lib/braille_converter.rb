require "pry"

class BrailleConverter
  def initialize
    # zero = raised dot & period = space
    @conversion_map = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00...."],
      "d" => ["00.0.."],
      "e" => ["0..0.."],
      "f" => ["000..."],
      "g" => ["0000.."],
      "h" => ["0.00.."],
      "i" => [".00..."],
      "j" => [".000.."],
      "k" => ["0...0."],
      "l" => ["0.0.0."],
      "m" => ["00..0."],
      "n" => ["00.00."],
      "o" => ["0..00."],
      "p" => ["000.0."],
      "q" => ["00000."],
      "r" => ["0.000."],
      "s" => [".00.0."],
      "t" => [".0000."],
      "u" => ["0...00"],
      "v" => ["0.0.00"],
      "w" => [".000.0"],
      "x" => ["00..00"],
      "y" => ["00.000"],
      "z" => ["0..000"]
    }
    @output = []
  end

  def output_to_file(incoming_text)
    convert_plain_text_to_braille(incoming_text)
    @output.map do |element|
     element << "\n"
   end.join
  end

  def convert_plain_text_to_braille(incoming_text)
    conversion = convert(incoming_text)
    putting_elements_in_row_1(conversion)
    putting_elements_in_row_2(conversion)
    putting_elements_in_row_3(conversion)
  end

  def convert(input)
    conversion = input.chars.map do |letter|
      @conversion_map[letter]
    end
  end

  def putting_elements_in_row_1(conversion)
    line_1 = []
    converted.map do |char_1|
      line_1 << converted[0][0]
    end
    @output << line_1
  end

  def putting_elements_in_row_2(conversion)
    line_2 = []
    converted.map do |char_2|
      line_2 << converted[0][1]
    end
    @output << line_2
  end

  def putting_elements_in_row_3(conversion)
    line_3 = []
    converted.map do |char_3|
      line_3 << converted[0][1]
    end
    @output << line_3
  end
end

# bc = BrailleConverter.new
# bc.convert_plain_text_to_braille("a")
