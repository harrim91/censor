require 'string_censor'

describe StringCensor do

	describe '#banned_words' do
		it 'starts with no banned words' do
			expect(subject.banned_words).to be_empty
		end

		it 'can add banned words' do
			subject.add_banned_word 'foo'
			expect(subject.banned_words).to eq ['foo']
		end
	end

	describe '#exceptions' do
		it 'starts with no exceptions' do
			expect(subject.exceptions).to be_empty
		end

		it 'can add banned words' do
			subject.add_exception 'football'
			expect(subject.exceptions).to eq ['football']
		end
	end

	describe '#censor' do
		before(:each) do
			subject.add_banned_word 'foo'
			subject.add_exception 'football'
		end
		
		it 'censors vowels in banned words' do
			expect(subject.censor 'foo bar').to eq 'f-- bar'
		end

		it 'is not case sensitive' do
			expect(subject.censor 'FOO bar').to eq 'F-- bar'
		end

		it 'censors words containing banned words' do
			expect(subject.censor 'FoObar').to eq 'F--b-r'
		end

		it 'does not censor exceptions containing banned words' do
			expect(subject.censor 'FoObar FoOtBaLl foo bar').to eq 'F--b-r FoOtBaLl f-- bar'
		end

	end

end