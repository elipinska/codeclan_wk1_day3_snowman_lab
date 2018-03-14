class Game
  attr_reader :player, :secret_word, :guessed_letters, :idx_to_reveal

  def initialize(input_player, input_secret_word)
    @player = input_player
    @secret_word = input_secret_word
    @guessed_letters = []
  end

  def guess(letter)
    if @guessed_letters.include?(letter)
      puts "You've already tried guessing this letter."
    elsif @secret_word.appears_in_word?(letter)
      puts "Yay, your secret word includes #{letter}!"
      idx_to_reveal = []
      @secret_word.word.split("").each_with_index do |l, idx|
        if letter == l
        idx_to_reveal << idx
        end
        idx_to_reveal.each {|num| @secret_word.display[num]= letter}
      end
    else
      @player.lose_a_life
      puts "Sorry, no #{letter} in your secret word. You have #{player.lives} lives left."
    end
    @guessed_letters << letter
  end

  def is_lost?
    @player.lives == 0
  end

  def is_won?
    @secret_word.display == @secret_word.word
  end

end
