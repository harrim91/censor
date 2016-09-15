class StringCensor
	def initialize
		@banned_words = []
	end

	attr_reader :banned_words

	def add_banned_word word
		@banned_words << word.downcase
	end

	def censor string
		words = string.split
		words.each do |word|
			word.gsub! /[AEIOUaeiou]/, '-' if banned? word
		end
		words.join ' '
	end

	private
	def banned? word
		@banned_words.any? do |banned_word| 
			Regexp.new(banned_word).match word.downcase
		end
	end

end