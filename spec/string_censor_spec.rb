require 'string_censor'

describe StringCensor do
	subject(:string_censor) { described_class.new }

	describe '#banned_words' do
		it 'starts with no banned words' do
			expect(string_censor.banned_words).to be_empty
		end

		it 'can add banned words' do
			string_censor.add_banned_word 'foo'
			expect(string_censor.banned_words).to eq ['foo']
		end
	end

	describe '#exceptions' do
		it 'starts with no exceptions' do
			expect(string_censor.exceptions).to be_empty
		end

		it 'can add banned words' do
			string_censor.add_exception 'football'
			expect(string_censor.exceptions).to eq ['football']
		end
	end

	describe '#censor' do
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
			expect(string_censor)			
		end

	end

	describe 'the ultimate test' do
		let(:banned_words) { ['red', 'blue', 'yellow', 'green'] }
		let(:exceptions) { ['covered', 'coloured', 'evergreens', 'greenbelt', 'blues']}
		let(:sentence) { 'it was a sunny day in the greenbelt. the sky was blue, but curiously the evergreens were full of red and yellow leaves. they were not green at all. this angered me - it was enough to give one the blues.' }
		let(:censored) { 'it was a sunny day in the greenbelt. the sky was bl--, but curiously the evergreens were full of r-d and y-ll-w leaves. they were not gr--n at all. this -ng-r-d me - it was enough to give one the blues.' }

		before(:each) do
			banned_words.each { |word| string_censor.add_banned_word word }
			exceptions.each { |word| string_censor.add_exception word }
		end
		it 'works' do
			expect(string_censor.censor sentence).to eq censored
		end
	end

end