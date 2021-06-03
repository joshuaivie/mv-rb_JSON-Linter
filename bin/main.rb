#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/modules/linter_text'
require_relative '../lib/file_reader'

begin
  file_path, *other_arguments = ARGV

  if file_path.nil?
    puts LinterText::NO_PATH.colorize(:red)
    sleep(2)
    exit
  end

  def fetch_file(file_path)
    file = FileReader.new(file_path)
    if file.error
      puts LinterText::BAD_PATH.colorize(:red)
      exit
    else
      puts LinterText::SUCCESFUL_READ.colorize(:green)
      if file.wrong_file_type
        puts LinterText::WRONG_FILE_TYPE.colorize(:red)
        exit
      end
    end
  end

  at_exit do
    puts LinterText::EXIT_MESSAGE.colorize(:green)
  end

  fetch_file(file_path)
rescue Interrupt
  system('stty -echoctl')
  puts LinterText::INTERRUPT_MESSAGE
  sleep(2)
  exit
end
