class CodeMaker

	def initialize(player)
		@player = player
		@@loop_break = false
		gameplay
	end

	def gameplay
		puts "\nYou are the CodeMaster. You have a selection of 6 different colors which you will use to create a horizontal pattern of 4 unique colors. After creating your pattern, the computer will then have 12 turns to try and guess the colors and the pattern the colors have been placed in."
		puts "\nColors are restricted to being used once per pattern."
		
		player_pattern

	end

	def player_pattern
		counter = 0
		player_input = ""

		while counter < 4
			puts "\nPlease select a color. The color you choose will be placed in the horizontal pattern in order of selection."
			puts "\"blue\" - \"red\" - \"green\" - \"brown\" - \"yellow\" - \"purple\""
			print "> "

			while player_input = gets.chomp.to_s.downcase
				case player_input
				when "blue"
					unique_color_check_cm("blue")
					break if @@loop_break == true
				when "red"
					unique_color_check_cm("red")
					break if @@loop_break == true
				when "green"
					unique_color_check_cm("green")
					break if @@loop_break == true
				when "brown"
					unique_color_check_cm("brown")
					break if @@loop_break == true
				when "yellow"
					unique_color_check_cm("yellow")
					break if @@loop_break == true
				when "purple"
					unique_color_check_cm("purple")
					break if @@loop_break == true
				else
					puts "\nIncorrect input. Please enter one these colors: \"blue\", \"red\", \"green\", \"brown\", \"yellow\", or \"purple\"."
					print "> "
				end
			end
			counter += 1
		end
	end

	def unique_color_check_cm(color)
		@@loop_break = false

		if !@player.code.any?("#{color}")
			@player.code << "#{color}"
			puts
			p @player.code
			@@loop_break = true
		else
			puts "\nCannot have more than one color per set. Please select a different color."
			print "> "
		end
	end
end