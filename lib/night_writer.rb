require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def convert_file_to_braille
    plain = reader.read
    convert_to_braille(plain)
  end

  def convert_to_braille(input)

  end
end
