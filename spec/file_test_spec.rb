require_relative '../lib/file_reader'
require_relative '../lib/file_tester'
require_relative '../lib/modules/text_format'

RSpec.describe FileTester do
  let(:file) { FileReader.new('./example/bad_code.json') }
  let(:tester) { FileTester.new(file) }

  context 'After file is tested' do
    describe '#run_tests' do
      it 'returns a hash with an errors key with all the errors raised' do
        expect(tester.run_tests.key?('errors')).to be true
      end
      it 'returns a hash with a summary  key with all the test summary' do
        expect(tester.run_tests.key?('summary')).to be true
      end
      it 'returns the list of errors as an array' do
        expect(tester.run_tests['errors'].class).to be Array
      end
      it 'returns the errors summary as a string' do
        expect(tester.run_tests['summary'].class).to be String
      end
    end
  end
end
