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
  end

  def convert_plain_text_to_braille(incoming_text)
    conversion = convert(incoming_text)
    convert_to_row1 = putting_elements_in_row_1(conversion)
    convert_to_row2 = putting_elements_in_row_2(conversion)
    convert_to_row3 = putting_elements_in_row_3(conversion)
  end

  def convert(input)
    letters = input.chars
    conversion = letters.map do |letter|
      @conversion_map[letter]
      end
    return conversion
  end

  def putting_elements_in_row_1(conversion)
    row1 = []
    convert_to_row1 = conversion.each do |row|
        row1 << conversion[0][0]
      end
    return row1
  end

  def putting_elements_in_row_2(conversion)
    row2 = []
    convert_to_row2 = conversion.each do |row|
        row2 << conversion[0][1]
      end
    return row2
  end

  def putting_elements_in_row_3(conversion)
    row3 = []
    convert_to_row3 = conversion.each do |row|
        row3 << conversion[0][2]
      end
    return row3
  end

end

bc = BrailleConverter.new
bc.convert_plain_text_to_braille("a")
