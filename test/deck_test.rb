require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'pry'
class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_that_deck_now_holds_the_instantiated_cards
    expected = [@card_1, @card_2, @card_3]
    actual = @deck.cards
    assert_equal expected, actual
  end

  def test_that_the_count_method_returns_the_array_length
    expected = 3
    actual = @deck.cards.length
    assert_equal expected, actual
  end
end
