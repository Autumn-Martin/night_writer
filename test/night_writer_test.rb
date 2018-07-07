require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/night_writer"

class NightWriterTest < Minitest::Test
  def test_night_writer_exists
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
  end

  def test_file_reader_exists
    file_reader = FileReader.new
    assert_instance_of FileReader, file_reader
  end

  def can_print_a_line_of_text
    
  end
end
