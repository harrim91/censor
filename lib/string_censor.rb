class StringCensor
	def initialize
		@banned_words = []
		@exceptions = []
	end

	def add_banned_word(word)
		@banned_words << format_word(word)
	end

	def add_exception(word)
		@exceptions << format_word(word)
	end

	def censor(string)
		words = string.split
		words.each do |word|
			word.gsub!(/[AEIOUaeiou]/, '-') unless allowed?(format_word(word))
		end
		words.join(' ')
	end

	private
	def allowed?(word)
		@exceptions.include?(word) ||
		@banned_words.none? {|banned_word| Regexp.new(banned_word).match(word)}
	end

	def format_word(word)
		word.downcase.gsub(/\W/, '')
	end

end