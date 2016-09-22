require 'string_censor'

describe StringCensor do
	subject(:string_censor) { described_class.new }

	describe '#censor' do
		context 'no words added' do
			it 'doesn\'t censor anything' do
				expect(string_censor.censor 'foo bar').to eq('foo bar')
			end
		end

		context 'with words added' do
			before(:each) do
				string_censor.add_banned_word 'foo'
				string_censor.add_exception 'football'
			end
			
			it 'censors vowels in banned words' do
				expect(string_censor.censor 'foo bar').to eq 'f-- bar'
			end

			it 'is not case sensitive' do
				expect(string_censor.censor 'FOO bar').to eq 'F-- bar'
			end

			it 'censors words containing banned words' do
				expect(string_censor.censor 'FoObar').to eq 'F--b-r'
			end

			it 'does not censor exceptions containing banned words' do
				expect(string_censor.censor 'FoObar FoOtBaLl foo bar').to eq 'F--b-r FoOtBaLl f-- bar'
			end

			it 'can deal with punctuation' do
				expect(string_censor.censor 'FoObar. FoOtBaLl. foo? bar!').to eq 'F--b-r. FoOtBaLl. f--? bar!'		
			end
		end

	end

end