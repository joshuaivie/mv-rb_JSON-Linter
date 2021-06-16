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
    @file_reporting_location = @file_location.concat('/', @file_name).to_s.blue
  end

  def run_tests
    test_results = {}

    # run individual tests
    end_with_new_line_test
    empty_line_test
    balanced_parenthesis_test

    # compile all errors
    compile_errors

    test_results['errors'] = @error_array
    test_results['summary'] = test_summary
    test_results
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/MethodLength
  def balanced_parenthesis_test
    parethesis_stack = [], parethesis_location_stack = [], line_count = 1, char_location = 0, string_index = 0
    escaped_loop = false

    string_array = @file_content.join.chars

    string_array.each_with_index do |char, index|
      string_index = index + 1
      if char == "\n"
        line_count += 1
        char_location = 0
      else
        char_location += 1
        if ['{', '['].include?(char)
          parethesis_stack << char
          parethesis_location_stack << "#{line_count}:#{char_location}"
        elsif ['}', ']'].include?(char)
          if parethesis_stack.empty?
            location = "#{@file_reporting_location}:#{line_count}:#{char_location}"
            log_error(char, location, JSONRules::CLOSEDPARENTHESIS[0], JSONRules::CLOSEDPARENTHESIS[1])
            escaped_loop = true
            break
          elsif (parethesis_stack[-1] == '{' && char != '}') || (parethesis_stack[-1] == '[' && char != ']')
            location = "#{@file_reporting_location}:#{parethesis_location_stack[-1]}"
            log_error(parethesis_stack[-1], location, JSONRules::OPENPARENTHESIS[0],
                      JSONRules::OPENPARENTHESIS[1])
            escaped_loop = true
            break
          elsif (parethesis_stack[-1] == '{' && char == '}') || (parethesis_stack[-1] == '[' && char == ']')
            parethesis_stack.pop
            parethesis_location_stack.pop
          end
        end
      end
    end

    return unless string_index == string_array.size && !parethesis_stack.empty? && !escaped_loop

    location = "#{@file_reporting_location}:#{parethesis_location_stack[-1]}"
    log_error(parethesis_stack[-1], location, JSONRules::OPENPARENTHESIS[0],
              JSONRules::OPENPARENTHESIS[1])
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/MethodLength

  def empty_line_test
    @file_content.each_with_index do |line, line_index|
      next unless line.lstrip == ''

      location = "#{@file_reporting_location}:#{line_index + 1}:#{line.size}"
      log_error(line, location, JSONRules::EMPTYLINEERROR[0], JSONRules::EMPTYLINEERROR[1])
    end
  end

  def end_with_new_line_test
    last_line = @file_content[-1]
    return unless last_line.chars[-1] != "\n"

    location = "#{@file_reporting_location}:#{@file_size}:#{last_line.chars.length}"
    log_error(last_line, location, JSONRules::NEWLINEERROR[0], JSONRules::NEWLINEERROR[1])
  end

  def log_error(error_line, error_location, error_classfication, error_details)
    @error_count += 1
    @error_line << error_line
    @error_location << error_location
    @error_classifiaction << error_classfication
    @error_details << error_details
  end

  def compile_errors
    @error_count.times do |index|
      unit_error = "#{@error_location[index]}: #{@error_classifiaction[index]}: #{@error_details[index]}\n"
      error_string = @error_line[index].lstrip == '' ? '' : @error_line[index].to_s.italic.to_s
      @error_array << unit_error.concat(error_string, "\n\n")
    end
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
