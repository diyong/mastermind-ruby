class CodeBreakerBoard
	def initialize(player)
		@player = player
		@player.guesses.each { |x| p x }
	end

end