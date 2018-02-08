require "./mm_module.rb"
include Tools

class CodeBreaker

	def initialize(player)
		@player = player
		@counter_outer = 0
		@counter_inner = 0
		@@victory = false
		@@loop_break = false
		@@comp_pattern = Hash.new	
		@@comp_pattern_arry = []
		@@comp_feedback	= []

		#Previous player choices and computer feedback is saved during
		#comp_feedback
		@@saved_choices_player = []
		@@saved_feedback = []
		gameplay
	end

	def gameplay
		puts "\nThe computer will choose between 6 separate colors (blue, red, green, brown, yellow, and purple) and fill 4 spaces in a specific order. Guess the correct combination of colors in the correct order within 12 tries and win."
		puts "If you need to look at your previous guesses and their corresponding feedback, type \"help\"."
		puts "Your guesses will be displayed on the board below. Good luck!"

		computer_pattern

		hash_to_arry(@@comp_pattern, @@comp_pattern_arry)
		
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
		player_input = ""

		while @counter_outer < 12
			while @counter_inner < 4
				puts "\nTurn #{@counter_outer+1}:"
				puts "Please enter a color."
				puts "\nColor choices are blue, red, green, brown, yellow, or purple."
				print "> "
				
				while player_input = gets.chomp.to_s.downcase
					case player_input
					when "blue"
						unique_color_check_cb("blue")
						break if @@loop_break == true
					when "red"
						unique_color_check_cb("red")
						break if @@loop_break == true
					when "green"
						unique_color_check_cb("green")
						break if @@loop_break == true
					when "brown"
						unique_color_check_cb("brown")
						break if @@loop_break == true
					when "yellow"
						unique_color_check_cb("yellow")
						break if @@loop_break == true
					when "purple"
						unique_color_check_cb("purple")
						break if @@loop_break == true
					when "help"
						help_feedback
					else
						puts "Incorrect input."
						print "> "
					end
				end
			end
			comp_feedback(@counter_outer)
			break if @@victory == true
			@counter_inner = 0
			@counter_outer += 1
		end
		puts "\nYou lose. Better luck next time!"
	end

	def comp_feedback(counter_outer)
		@player.guesses[counter_outer].each_with_index do |elem, indx|
			@@comp_pattern_arry.each_with_index do |elem_y, indx_y|
				if indx == indx_y && elem == elem_y
					@@comp_feedback << "X"
				elsif elem == elem_y
					@@comp_feedback << "O"
				end
			end
		end
		@@saved_choices_player << @player.guesses[counter_outer]
		@@saved_feedback << @@comp_feedback
		p @@comp_feedback
		victory_check
		@@comp_feedback = []
	end

	def help_feedback
		for i in 0...@@saved_feedback.length
			puts "\nTurn #{i+1}:"
			p @@saved_choices_player[i]
			p @@saved_feedback[i]
		end
		puts "\nPlease enter a color."
		puts "\nColor choices are blue, red, green, brown, yellow, or purple."
		print "> "
	end

	#victory_check has been placed inside comp_feedback to catch the
	#@@comp_feedback variable before it's been cleared for the next round.
	def victory_check
		if @@comp_feedback.all? { |x| x == "X" } && @@comp_feedback.length == 4
			puts "\nYou guessed all four colors and their placements correctly. Congratulations!"
			@@victory = true
		end
	end

	def unique_color_check_cb(color)
		@@loop_break = false
		if !@player.guesses[@counter_outer].any?("#{color}")
			@player.guesses[@counter_outer][@counter_inner] = "#{color}"
			@counter_inner += 1
			puts
			p @player.guesses[@counter_outer]
			@@loop_break = true
		else
			puts "\nCannot have more than one color per set. Please select a different color."
			print "> "
		end
	end

end

