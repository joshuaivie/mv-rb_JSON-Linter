require_relative '../lib/file_reader'

RSpec.describe FileReader do
  let(:good_file) { FileReader.new('./example/good_code.json') }
  let(:empty_file) { FileReader.new('./example/empty_code.json') }
  let(:wrong_file_type) { FileReader.new('./example/wrong_file_type.rb') }
  let(:wrong_file_path) { FileReader.new('./example/non-existent.json') }

  context 'Initialized' do
    context 'when initialiazed with non empty json file' do
      it 'reads the content of the file' do
        expect(good_file.file_content).not_to be nil
      end
      it 'stores the files content in an array' do
        expect(good_file.file_content.class).to be Array
      end
      it 'stores the size of the file_content array' do
        expect(good_file.file_size).to eql(good_file.file_content.size)
      end
      it 'stores the file directory and file name in an array' do
        expect(good_file.file_split.class).to be Array
      end
    end
    context 'when initialiazed with empty code' do
      it 'flags the instance as empty' do
        expect(empty_file.is_empty).to be true
      end
    end
    context 'when initialiazed with a file other than a JSON file' do
      it 'flags the instance as using a wrong file type' do
        expect(wrong_file_type.wrong_file_type).to be true
      end
    end
    context 'when initialiazed with a worng path' do
      it 'flags the instance as having a read error' do
        expect(wrong_file_path.read_error.class).to be Errno::ENOENT
      end
    end
  end
end
