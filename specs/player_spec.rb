require('minitest/autorun')
require_relative('../player')


class PlayerTest < MiniTest::Test

  def setup
    @my_player = Player.new("Ewa")
  end

  def test_player_has_name
    assert_equal("Ewa", @my_player.name)
  end

  def test_player_has_lives
    assert_equal(6, @my_player.lives)
  end

end
