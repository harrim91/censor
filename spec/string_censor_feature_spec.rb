require 'string_censor'

describe 'StringCensor' do
	subject(:string_censor) { StringCensor.new }
	let(:banned_words) { ['red', 'blue', 'yellow', 'green'] }
	let(:exceptions) { ['covered', 'coloured', 'evergreens', 'greenbelt', 'blues']}
	let(:sentence) { 'it was a sunny day in the greenbelt. the sky was blue, but curiously the evergreens were full of red and yellow leaves. they were not green at all. this angered me - it was enough to give one the blues.' }
	let(:censored) { 'it was a sunny day in the greenbelt. the sky was bl--, but curiously the evergreens were full of r-d and y-ll-w leaves. they were not gr--n at all. this -ng-r-d me - it was enough to give one the blues.' }

	before(:each) do
		banned_words.each { |word| string_censor.add_banned_word word }
		exceptions.each { |word| string_censor.add_exception word }
	end
	it 'censors the string correctly' do
		expect(string_censor.censor sentence).to eq censored
	end
end