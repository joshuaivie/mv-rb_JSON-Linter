#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/modules/linter_text'

begin
  file_path, *other_arguments = ARGV

  if file_path.nil?
    puts LinterText::NO_PATH
    sleep(2)
    exit
  end

  def fetch_file; end
rescue Interrupt
  system('stty -echoctl')
  puts LinterText::INTERRUPT_MESSAGE
  sleep(2)
  exit
end
