class CodeBreaker

	def initialize(player)
		@player = player
		@@comp_pattern = Hash.new	
		game_play
	end

	def game_play
		puts "\nThe computer will choose between 6 separate colors (blue, red, green, brown, yellow, and purple) and fill 4 spaces in a specific order. Guess the correct combination of colors in the correct order within 12 tries and win."
		puts "Your guesses will be displayed on the board below. Good luck!\n\n"

		computer_pattern
		
		
	end

	private

	def computer_pattern
		counter = 0
		color_combo = { 0 => "blue", 1 => "red", 2 => "green", 3 => "brown", 4 => "yellow", 5 => "purple" }

		while counter < 4
				y = rand(0...6)

				case y
				when 0
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "blue"
						counter += 1
					end
				when 1
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "red"
						counter += 1
					end
				when 2
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "green"
						counter += 1
					end
				when 3
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "brown"
						counter += 1
					end
				when 4
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "yellow"
						counter += 1
					end
				when 5
					if !@@comp_pattern.has_key?(y)
						@@comp_pattern[y] = "purple"
						counter += 1
					end
				end
		end
	end

end

