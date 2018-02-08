module Tools

	def init_menu
		input = ""
		end_loop = false
		puts "\nPlease select an option:"
		puts "1) Player is the CodeMaker"
		puts "2) Player is the CodeBreaker"
		puts "3) Instructions"
		print "> "
		loop do
			input = gets.chomp.to_i
			case input
			when 1
				puts "\nYou have selected (CodeMaker)."
				end_loop = true
				break if end_loop == true
			when 2
				puts "\nYou have selected (CodeBreaker)."
				end_loop = true
				break if end_loop == true
			when 3
				puts "\nYou have selected (Instructions)."
				end_loop = true
				break if end_loop == true
			else
				puts "\nIncorrect input. Please select one of the options listed above (1 - 3)."
			end
		end
		return input
	end

	def init_menu_instructions
		puts "\nMastermind is a code-breaking game for two players... or 1 player and 1 crafty computer! This version of Mastermind will pit one player against a computer. The player can either be the CodeMaker (the one to create the pattern) or the CodeBreaker (the one that needs to guess the pattern)."
		puts "\nThe CodeMaker will have to create a pattern of 4 colors in a straight line which the CodeBreaker will then have 12 tries to guess (the colors and the positions). After each guess, the CodeBreaker will be told how many of their colors have been guessed correctly (\"O's\"). Additionally, the CodeBreaker will also be told how many of their correct guesses are in the correct position compared to the CodeMaker's pattern (\"X's\")."
		puts "\nGuess the correct colors in the correct order in 12 tries and the CodeBreaker wins!"
	end

	def hash_to_arry(hsh, arry)
		hsh.each do |key, value|
			arry << value
		end
	end

	def random_color
		rand_color = ""
		color_combo = { 0 => "blue", 1 => "red", 2 => "green", 3 => "brown", 4 => "yellow", 5 => "purple" }

		rand_color = rand(0..5)
		return color_combo[rand_color]
	end
end
