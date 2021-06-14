require_relative './modules/rules_json'

class FileTester
  attr_reader :error_count

  def initialize(file)
    # error variables
    @error_count = 0
    @error_array = []
    @error_details = []
    @error_location = []
    @error_line = []
    @error_classifiaction = []

    # file variables
    @file_size = file.file_size
    @file_content = file.file_content
    @file_name = file.file_split[1]
    @file_location = file.file_split[0].delete_prefix('./')
  end

  def run_tests
    test_results = {}

    # run individual tests
    end_with_new_line_test
    empty_line_test

    # compile all errors
    compile_errors

    test_results['errors'] = @error_array
    test_results['summary'] = test_summary
    test_results
  end

  private

  def compile_errors
    @error_count.times do |index|
      unit_error = "#{@error_location[index]}: #{@error_classifiaction[index]}: #{@error_details[index]}\n"
      error_string = @error_line[index].lstrip == '' ? '' : @error_line[index].to_s.italic.to_s
      @error_array << unit_error.concat(error_string, "\n\n")
    end
  end

  def empty_line_test
    @file_content.each_with_index do |line, line_index|
      next unless line.lstrip == ''

      @error_count += 1
      @error_line << line
      @error_location << "#{@file_location.concat('/', @file_name).to_s.blue}:#{line_index}:#{line.size}"
      @error_classifiaction << JSONRules::EMPTYLINEERROR[0]
      @error_details << JSONRules::EMPTYLINEERROR[1]
    end
  end

  def end_with_new_line_test
    last_line = @file_content[-1]
    return unless last_line.chars[-1] != "\n"

    @error_count += 1
    @error_line << last_line
    @error_location << "#{@file_location.concat('/', @file_name).to_s.blue}:#{@file_size}:#{last_line.chars.length}"
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
