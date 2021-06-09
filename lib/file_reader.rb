class FileReader
  attr_reader :read_error, :wrong_file_type, :is_empty, :file_name, :file_size, :file_content

  def initialize(file_path)
    @file_path = file_path

    if File.extname(@file_path) == '.json'
      @file_name = File.basename(@file_path, ".json")
      @file_content = File.readlines(@file_path)
      @file_size = @file_content.length
      @is_empty = true if File.empty?(@file_path) || @file_size.zero?
    else
      @wrong_file_type = true
    end
  rescue StandardError => e
    @read_error = e
  end
end
