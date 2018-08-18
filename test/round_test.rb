require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/guess'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_that_the_deck_object_is_passed_to_round
    actual = @round.deck
    assert_instance_of Deck, actual
  end

  def test_that_guesses_starts_out_empty
    expected = []
    actual = @round.guesses
    assert_equal expected, actual
  end
end
