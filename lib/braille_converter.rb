require "pry"

class BrailleConverter
  def initialize
    # zero = raised dot & period = space
    @conversion_map = {
      "a" => ["0....."],
      "b" => ["0.0..."],
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

  def convert(input)
    letters = input.chars
    conversion = letters.map do |letter|
      @conversion_map[letter]
      end
    return conversion.join
  end

end
