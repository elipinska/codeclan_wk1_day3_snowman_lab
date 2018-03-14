require('minitest/autorun')
require_relative('../game')
require_relative('../player')
require_relative('../hidden_word')


class GameTest < MiniTest::Test

  def setup
    @my_game = Game.new(Player.new("Ewa"), HiddenWord.new("my word"))
  end

  def test_game_has_player_named_ewa_with_6_lives
    assert_equal("Ewa", @my_game.player.name)
    assert_equal(6, @my_game.player.lives)
  end

  def test_game_has_hidden_word
    assert_equal("** ****", @my_game.secret_word.display)
  end

  def test_game_has_empty_array_for_guessed_letters
    assert_equal([], @my_game.guessed_letters)
  end

  def test_guess_correct
    @my_game.guess("w")
    assert_equal(6, @my_game.player.lives)
    assert_equal(["w"], @my_game.guessed_letters)
    assert_equal("** w***", @my_game.secret_word.display)
  end

  def test_multiple_guesses
    @my_game.guess("w")
    @my_game.guess("p")
    @my_game.guess("o")
    @my_game.guess("i")

    assert_equal(4, @my_game.guessed_letters.length)
    assert_equal(4, @my_game.player.lives)
    assert_equal("** wo**", @my_game.secret_word.display)
  end

  def test_guess_incorrect
    @my_game.guess("z")
    assert_equal(5, @my_game.player.lives)
    assert_equal(["z"], @my_game.guessed_letters)
  end

  def test_guess_change_display
    @my_game.guess("o")
    @my_game.guess("y")
    assert_equal("*y *o**", @my_game.secret_word.display)
  end

  def test_is_lost__true
    @my_game.guess("x")
    @my_game.guess("p")
    @my_game.guess("u")
    @my_game.guess("i")
    @my_game.guess("a")
    @my_game.guess("n")
    @my_game.guess("q")

    assert_equal(true, @my_game.is_lost?)
  end

  def test_is_lost__false
    @my_game.guess("x")
    @my_game.guess("p")
    @my_game.guess("u")
    assert_equal(false, @my_game.is_lost?)
  end

  def test_is_won__true
    @my_game.guess("m")
    @my_game.guess("d")
    @my_game.guess("y")
    @my_game.guess("o")
    @my_game.guess("w")
    @my_game.guess("r")
    assert_equal(true, @my_game.is_won?)
  end

  def test_is_won__false
    @my_game.guess("m")
    @my_game.guess("d")
    @my_game.guess("y")
    assert_equal(false, @my_game.is_won?)
  end

end
