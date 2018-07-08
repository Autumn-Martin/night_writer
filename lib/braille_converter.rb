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

  def convert(input)
    letters = input.chars
    conversion = letters.map do |letter|
      @conversion_map[letter]
      end
    return conversion
  end

  def putting_elements_in_row_1(conversion)
    row1 = []
    conversion.each do |row|
        row1 << conversion[0][0]
      end
    return row1
  end

  def putting_elements_in_row_2(conversion)
    row2 = []
    conversion.each do |row|
        row2 << conversion[0][1]
      end
    return row2
  end
  # letters.each do |letter|
  #   letter[0].each do



  # def convert(input)
  #   letters = input.chars
  #   conversion = letters.map do |letter|
  #     braille_rows(letter)
  #   end
  #   return conversion
  # end
  #
  # def braille_rows(letter)
  #   @conversion_map[letter].map do |row|
  #     row
  #   end
  # end
  #
  # def print_to_terminal(letters) #formats array of letters so that it looks pretty on terminal
  #   letters.each do |letter|
  #     letter.each do |row|
  #       row.each do |character|
  #         print character
  #       end
  #       puts "\n"
  #     end
  #   end
  # end
end
