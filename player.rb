class Player
  attr_reader :name, :lives

  def initialize(input_name)
    @name = input_name
    @lives = 6
  end

  def lose_a_life()
    @lives -= 1 if @lives > 0
  end

end
