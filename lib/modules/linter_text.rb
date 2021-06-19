module LinterText
  NO_PATH = 'No path provided'.freeze
  HOWTOPROVIDEPATH = "To provide a path add the relative path as command line argument when you run the linter.
example: bin/main.rb [./relative-file-path/file]\n\n".freeze
  BAD_PATH = "The path provided is incorrect. Please correct it and try again.\n.\n".freeze
  SUCCESFUL_READ = 'The file was read succesfully.'.freeze
  ANALYZING_FILE = "Analyzing file.\n...\n\n".freeze
  WRONG_FILE_TYPE = 'The file supplied is not a JSON file.'.freeze
  EMPTY_FILE = 'The file supplied is empty.'.freeze
  EXIT_MESSAGE = "Exiting gracefully.\n".freeze
  INTERRUPT_MESSAGE = "The process was interrupted ...\n".freeze
end
