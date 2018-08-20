require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("Jack", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Ace", "Spades")
    @card_5 = Card.new("Ace", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])

  end

  def test_that_deck_now_holds_the_instantiated_cards
    expected = [@card_1, @card_2, @card_3, @card_4, @card_5]
    actual = @deck.cards
    assert_equal expected, actual
  end

  def test_that_the_count_method_returns_the_array_length
    expected = 5
    actual = @deck.cards.length
    assert_equal expected, actual
  end

  def test_that_sort_sorts_the_deck_of_cards
    expected = [@card_1, @card_3, @card_2, @card_5, @card_4]
    actual = @deck.sort
    assert_equal expected, actual
  end
end
