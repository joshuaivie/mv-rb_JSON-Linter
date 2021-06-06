class FileTester
  attr_reader :error_count

  def initialize(file)
    @file_path = file.file_path
    @error_location = []
    @error_classifiaction = []
    @possible_resolution = []
    @error_count = 2
    @error_array = []
  end

  def run_tests
    'Thank you Father'
  end

  def test_summary
    file_summary = '1 file'
    error_summary = if error_count.zero?
                      "#{error_count} offenses".green
                    elsif error_count == 1
                      "#{error_count} offense".red
                    else
                      "#{error_count} offenses".red
                    end
    "\n#{file_summary} inspected, #{error_summary} detected"
  end
end
