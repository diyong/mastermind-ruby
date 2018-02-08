require "./player.rb"
require "./codebreaker.rb"
require "./codemaker.rb"
require "./codebreakerboard.rb"
require "./mm_module.rb"
include Tools

player = ""
init_menu_sel = ""
init_loop = true

puts "Welcome to Mastermind: \"I hope I don't stumble through this\" Edition!"

puts "\nPlease enter Player's name:"
print "> "
player = Player.new(gets.chomp.to_s)
puts "\nWelcome, #{player.name}!"

#Looped the init_menu for sake of "Instructions." The player should be able to select a different option right after reading the instructions for the game.
loop do
	init_menu_sel = init_menu

	case init_menu_sel
	when 1
		CodeMaker.new(player)
		init_loop = false
		break if init_loop == false
	when 2
		CodeBreaker.new(player)
		init_loop = false
		break if init_loop == false
	when 3
		init_menu_instructions
	end
end


