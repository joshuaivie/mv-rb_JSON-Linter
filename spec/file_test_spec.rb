require_relative '../lib/file_reader'
require_relative '../lib/file_tester'
require_relative '../lib/modules/text_format'

RSpec.describe FileTester do
  let(:file) { FileReader.new('./example/bad_code.json') }
  let(:tester) { FileTester.new(file) }

  context 'Initialize' do
    context 'when first initialized with a file object' do
      it 'has an initial count of errors set to zero' do
        expect(tester.error_count).to eql(0)
      end
    end
  end

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
      it 'updates the error_count accessor' do
        expect(tester.run_tests['errors'].size).to eql(tester.error_count)
      end
    end
  end
end
