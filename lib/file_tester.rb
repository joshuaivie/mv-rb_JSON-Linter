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
    test_results = {}
    test_results['errors'] = @error_array
    test_results['summary'] = test_summary
    test_results
  end

  private

  def test_summary
    file_summary = '1 file'
    error_summary = if error_count.zero?
                      'no offenses'.green
                    elsif error_count == 1
                      "#{error_count} offense".red
                    else
                      "#{error_count} offenses".red
                    end
    "\n#{file_summary} inspected, #{error_summary} detected"
  end
end
