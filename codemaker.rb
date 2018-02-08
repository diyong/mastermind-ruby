require "./mm_module.rb"
include Tools

class CodeMaker

	def initialize(player)
		@player = player
		@@counter_outer = 0
		@@loop_break = false
		@@victory = false
		@@comp_save = Array.new(4, default = "*")
		@@comp_guesses = Array.new(12) { Array.new }
		@@feedback = []
		gameplay
	end

	def gameplay
		puts "\nYou are the CodeMaker. You have a selection of 6 different colors which you will use to create a horizontal pattern of 4 unique colors. After creating your pattern, the computer will then have 12 turns to try and guess the colors and the pattern the colors have been placed in."
		puts "\nColors are restricted to being used once per pattern."

		player_pattern

		puts "\nThe computer will now try to guess your colors and pattern."

		comp_algorithm

	end

	private

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

	def comp_algorithm
		#comp_guess_gen does not take account of feedback. Only used to create 
		#initial guess.
		comp_guess_initial

		while @@counter_outer < 12

			comp_guess_feedback	
			puts "\nTurn #{@@counter_outer+1}:"
			puts "Your code:"
			puts "#{@player.code}"
			puts "\nThe computer guessed:"
			puts "#{@@comp_guesses[@@counter_outer]}"

			feedback
			break if @@victory == true

			puts "\nPress Enter to start the next turn:"
			print "> "

			x = gets.chomp.to_s

			@@counter_outer += 1
		
		end
		puts "\nYou win! The computer failed to guess your code. Congratulations, CodeMaker."
	end

	def comp_guess_initial
		counter = 0
		color_combo = { 0 => "blue", 1 => "red", 2 => "green", 3 => "brown", 4 => "yellow", 5 => "purple" }

		while counter < 4
			y = rand(0...6)
			case y
			when 0
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "blue"
					counter += 1
				end
			when 1
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "red"
					counter += 1
				end
			when 2
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "green"
					counter += 1
				end
			when 3
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "brown"
					counter += 1
				end
			when 4
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "yellow"
					counter += 1
				end
			when 5
				if !@@comp_guesses[@@counter_outer].any?(color_combo[y])
					@@comp_guesses[@@counter_outer] << "purple"
					counter += 1
				end
			end
		end
	end

	def feedback
		@@comp_guesses[@@counter_outer].each_with_index do |elem, indx|
			@player.code.each_with_index do |elem_y, indx_y|
				if @player.code.any?(elem)
					if indx == indx_y && elem == elem_y
						@@feedback << "X"
						break
					elsif elem == elem_y
						@@feedback << "O"
						break
					end
				else
					@@feedback << "*"
					break
				end
			end
		end
		comp_save
		p @@feedback
		victory_check
		@@feedback = []
	end

	def comp_save
		@@comp_save = Array.new(4, default = "*")

		@@feedback.each_with_index do |elem, indx|
			if elem == "X"
				@@comp_save[indx] = @@comp_guesses[@@counter_outer][indx] + "+x"
			elsif elem == "O"
				@@comp_save[indx] = @@comp_guesses[@@counter_outer][indx] + "+o"
			end
		end
	end

	def comp_guess_feedback
		rand_int = ""
		rdm_clr = ""

		@@comp_save.each_with_index do |elem, indx|
			if elem.match?(/x$/)
				@@comp_guesses[@@counter_outer][indx] = elem.slice(0...-2)
			end
		end

		@@comp_save.each_with_index do |elem, indx|
			if elem.match?(/o$/)
				loop do 
					rand_int = rand(0...4)
					if !@@comp_guesses[@@counter_outer][rand_int].is_a?(String)
						@@comp_guesses[@@counter_outer][rand_int] = elem.slice(0...-2)
						break
					end
				end
			end
		end

		@@comp_guesses[@@counter_outer].each_with_index do |elem, indx|
			if elem == nil
				loop do
					rdm_clr = random_color

					unless @@comp_guesses[@@counter_outer].any?(rdm_clr)
						@@comp_guesses[@@counter_outer][indx] = rdm_clr
						break
					end
				end
			end
		end

		if @@comp_guesses[@@counter_outer].length < 4
			rdm_clr = random_color

			unless @@comp_guesses[@@counter_outer].any?(rdm_clr)
				@@comp_guesses[@@counter_outer] << rdm_clr
			end
		end

	end

	def victory_check
		if @@feedback.all?("X") && @@feedback.length == 4
			puts "\nComputer wins! The computer won in #{@@counter_outer+1} turns."
			@@victory = true
		end
	end


end