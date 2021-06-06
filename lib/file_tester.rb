class FileTester
  attr_reader :error_count

  def initialize(file)
    @file_path = file.file_path
    @error_location = []
    @error_classifiaction = []
    @possible_resolution = []
    @error_count = 0
    @error_array = []
  end

  def run_tests
    'Thank you Father'
  end
end
