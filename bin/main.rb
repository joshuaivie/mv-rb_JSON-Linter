#!/usr/bin/env ruby

begin
rescue Interrupt
  system('stty -echoctl')
  puts LinterText::INTERRUPT_MESSAGE
  sleep(2)
  exit
end
