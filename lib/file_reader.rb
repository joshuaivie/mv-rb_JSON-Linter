class FileReader
  attr_reader :file_path, :wrong_file_type, :is_empty, :file_content, :file_size, :error

  def initialize(file_path)
    @file_path = file_path

    if File.extname(@file_path) == '.json'
      @file_content = File.readlines(@file_path)
      @file_size = @file_content.length
      @is_empty = true if File.empty?(@file_path) || @file_size.zero?
    else
      @wrong_file_type = true
    end
  rescue StandardError => e
    @error = e
  end
end
