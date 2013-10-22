require 'random-word'

puts
selected_word = RandomWord.nouns.next.gsub("_", " ")
#puts selected_word

initial_spaces = selected_word.each_char do |c| 
	if c == " "
		print "  "
	else
		print '_ '
	end
end
puts
puts

show_me = 1
user_guesses = [" "]
missed_guesses = 0
knife = 'O={====>         (o_o)'

until show_me == selected_word
	puts "Please guess a letter"
	current_guess = gets.chomp.downcase

	if user_guesses.include?(current_guess) || current_guess.length != 1 || current_guess[/^[a-zA-Z]*$/] == nil
		puts
		puts "Invalid guess"
		puts
	else
		user_guesses << current_guess
	
		if /#{current_guess}/.match(selected_word)
			puts
			puts "Great guess!"
			puts
			show_me = selected_word.tr("^#{user_guesses}", "_")
			show_me.each_char {|c| print c, " "}
			puts
			puts
			puts user_guesses.to_s
			puts
			puts knife
			puts
		else
			puts
			puts "Nice try, guess again."
			puts
			show_me = selected_word.tr("^#{user_guesses}", "_")
			show_me.each_char {|c| print c, " "}
			missed_guesses += 1
			puts
			puts
			puts user_guesses.to_s 
			if missed_guesses == 10
				puts
				puts '      O={=(x_x)=>'
				puts
				selected_word.each_char {|c| print c, " "}
				puts
				puts
				exit
			end 
			puts
			knife = knife.sub(/\s/, "")
			puts knife
			puts
		end
	end
end

puts "       VICTORY"
puts '     () (o_o) ()'
puts '         | |'
puts