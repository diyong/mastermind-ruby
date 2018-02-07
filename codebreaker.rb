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
		
		player_actions
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

	def player_actions
		counter_outer = 0
		counter_inner = 0
		player_input = ""

		while counter_outer < 12
			while counter_inner < 4
				puts "Counter inner is #{counter_inner}"
				puts "\nPlease enter a color."
				puts "\nColor choices are blue, red, green, brown, yellow, or purple."
				print "> "
				
				while player_input = gets.chomp.downcase
					case player_input
					when "blue"
						@player.guesses[counter_outer][counter_inner] = "blue"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					when "red"
						@player.guesses[counter_outer][counter_inner] = "red"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					when "green"
						@player.guesses[counter_outer][counter_inner] = "green"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					when "brown"
						@player.guesses[counter_outer][counter_inner] = "brown"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					when "yellow"
						@player.guesses[counter_outer][counter_inner] = "yellow"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					when "purple"
						@player.guesses[counter_outer][counter_inner] = "purple"
						counter_inner += 1
						p @player.guesses[counter_outer]
						break
					else
						puts "Incorrect input."
					end
				end
				
			end
			counter_inner = 0
			counter_outer += 1
		end
	end

end

