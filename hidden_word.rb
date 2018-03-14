class HiddenWord
  attr_reader :word, :display

  def initialize(input_word)
    @word = input_word
    @display = @word.gsub(/[^\s]/, "*")
  end

  def appears_in_word?(letter)
    @word.include?(letter)
  end


end
