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
			word.gsub! /[AEIOUaeiou]/, '-' if @banned_words.include? word.downcase
		end
		words.join ' '
	end

end