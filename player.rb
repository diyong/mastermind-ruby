class Player
	attr_reader :name
	attr_accessor :guesses

	def initialize(name)
		@name = name
		@guesses = Array.new(12) { Array.new(4, default = "*") }
	end

end