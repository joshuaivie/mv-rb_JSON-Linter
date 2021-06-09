require_relative './modules/rules_json'

class FileTester
  attr_reader :error_count

  def initialize(file)
    @file_name = file.file_name
    @file_size = file.file_size
    @file_content = file.file_content
    @error_location = []
    @error_classifiaction = []
    @error_details = []
    @error_array = []
    @error_count = 0
  end

  def run_tests
    test_results = {}

    # run individual tests
    end_with_new_line_test

    # gather all errors

    test_results['errors'] = @error_array
    test_results['summary'] = test_summary
    test_results
  end

  private

  def end_with_new_line_test
    last_line = @file_content[-1]
    return unless last_line.chars[-1] != "\n"

    @error_count += 1
    @error_location << "#{file_name}:#{file_size}:#{last_line.chars.length}:"
    @error_classifiaction << JSONRules::NEWLINEERROR[0]
    @error_details << JSONRules::NEWLINEERROR[1]
  end

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
