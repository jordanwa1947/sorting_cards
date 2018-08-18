require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_a_guess_is_given
    expected = "10 of Hearts"
    actual = @guess.response
    assert_equal expected, actual
  end

  def test_an_instance_of_the_card_class_was_passed
    expected = Card
    actual = @guess.card
    assert_instance_of expected, actual
  end
end
