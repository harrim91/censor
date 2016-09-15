class StringCensor
	def initialize
		@banned_words = []
		@exceptions = []
	end

	attr_reader :banned_words, :exceptions

	def add_banned_word word
		@banned_words << word.downcase
	end

	def add_exception word
		@exceptions << word.downcase
	end

	def censor string
		words = string.split
		words.each do |word|
			# p word
			# p allowed? word.gsub(/\W+/, '')
			word.gsub! /[AEIOUaeiou]/, '-' unless allowed? word.gsub(/\W+/, '')
		end
		words.join ' '
	end

	private
	def allowed? word
		@exceptions.include?(word.downcase) ||
		@banned_words.none? do |banned_word| 
			Regexp.new(banned_word).match word.downcase
		end
	end

end