require_relative('./game')
require_relative('./player')
require_relative('./hidden_word')

puts "Specify a word/phrase to guess:"
hidden_word = gets.chomp.downcase
system('clear')
#puts "\e[H\e[2J"
puts "Welcome to the game! What's your name?"
player_name = gets.chomp
my_game = Game.new(Player.new(player_name), HiddenWord.new(hidden_word))
puts "Hello #{player_name}! Here's a word/phrase for you to guess:"
while my_game.is_won? == false && my_game.is_lost? == false
  puts my_game.secret_word.display
  puts "Try guessing one of the letters."
  answer = gets.chomp
  while answer.length != 1
    puts "Guess only one letter at a time!"
    puts my_game.secret_word.display
    answer = gets.chomp
  end
  my_game.guess(answer)
end
if my_game.is_won?
  puts my_game.secret_word.display
puts "Congratulations! You won :-)"
else
  puts my_game.secret_word.display
  puts "Oh no, you ran out of lives :-("
end
