require_relative '../lib/file_reader'

RSpec.describe FileReader do
  let(:good_code) { '../example/good_code.json' }
  let(:bad_code) { '../example/bad_code.json' }
  let(:empty_code) { './example/empty_code.json' }
  let(:wrong_file_type) { './example/wrong_file_type.rb' }

  context 'creating' do
    context 'when initialiazed with empty code' do
      it 'flags the instance as empty' do
        file = FileReader.new(empty_code)
        p file
        expect(file.is_empty).to be true
      end
    end
    # context 'when a seed is not specified' do
    #   it 'creates its own seed' do
    #     generator = Generator.new
    #     generator.seed.should_not be_nil
    #   end
    # end
  end
end
