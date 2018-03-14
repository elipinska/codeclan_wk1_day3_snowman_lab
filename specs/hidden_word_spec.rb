require('minitest/autorun')
require_relative('../hidden_word')

class HiddenWordTest < MiniTest::Test

  def setup
    @my_hidden_word = HiddenWord.new("secret password")
  end

  def test_hidden_word_has_word
    assert_equal("secret password", @my_hidden_word.word)
  end

  def test_initial_display
    assert_equal("****** ********", @my_hidden_word.display)
  end

  def test_appears_in_word__true
    assert_equal(true, @my_hidden_word.appears_in_word?("e"))
  end

  def test_appears_in_word__false
    assert_equal(false, @my_hidden_word.appears_in_word?("z"))
  end

end
