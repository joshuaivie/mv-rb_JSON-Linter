#!/usr/bin/env ruby
require_relative '../lib/modules/linter_text'
require_relative '../lib/modules/text_format'
require_relative '../lib/file_reader'
require_relative '../lib/file_tester'

begin
  file_path = ARGV[0]

  # Make sure file path is given
  if file_path.nil?
    puts LinterText::NO_PATH.red
    sleep(2)
    exit
  end

  # Read and Analyze file
  def analyze_file(file_path)
    file = FileReader.new(file_path)
    if file.read_error
      puts LinterText::BAD_PATH.red
      exit
    else
      puts LinterText::SUCCESFUL_READ.green.bold
      puts LinterText::ANALYZING_FILE.italic
      if file.wrong_file_type
        puts LinterText::WRONG_FILE_TYPE.red
        exit
      elsif file.is_empty
        puts LinterText::EMPTY_FILE.red
        exit
      end
    end

    file_tester = FileTester.new(file)
    errors = file_tester.run_tests
    puts errors unless file_tester.error_count.zero?
    puts file_tester.test_summary
  end

  # Handle exit gracefully
  at_exit do
    puts LinterText::EXIT_MESSAGE.green
  end

  # Execute linter
  analyze_file(file_path)

  # Handle process interrupt
rescue Interrupt
  system('stty -echoctl')
  puts LinterText::INTERRUPT_MESSAGE
  sleep(2)
  exit
end
