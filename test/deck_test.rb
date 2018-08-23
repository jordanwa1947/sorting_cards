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
    @card_6 = Card.new("Queen", "Hearts")
    @card_7 = Card.new("King", "Spades")
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4,
                                @card_5, @card_6,@card_7])

  end

  def test_that_deck_now_holds_the_instantiated_cards
    expected = [@card_1, @card_2, @card_3, @card_4,
                         @card_5, @card_6, @card_7]
    actual = @deck.cards
    assert_equal expected, actual
  end

  def test_that_the_count_method_returns_the_array_length
    expected = 7
    actual = @deck.cards.length
    assert_equal expected, actual
  end

  def test_that_the_sort_method_sorts_the_deck_of_cards_from_lowest_to_highest
    expected = [@card_1, @card_3, @card_2, @card_6, @card_7, @card_5, @card_4]
    actual = @deck.sort
    assert_equal expected, actual
  end

  def test_that_convert_to_sort_converts_aces_to_laces_and_queens_to_keens
    @deck.convert_to_sort
    assert_equal "Lace", @card_4.value
    assert_equal "Lace", @card_5.value
    assert_equal "Keen", @card_6.value
  end

  def test_that_revert_back_converts_laces_back_to_Aces_and_queens_back_to_keens
    @deck.revert_back
    assert_equal "Ace", @card_5.value
    assert_equal "Ace", @card_4.value
    assert_equal "Queen", @card_6.value
  end
  def test_that_the_merge_sort_method_sorts_the_deck_of_cards_from_lowest_to_highest
    actual = @deck.merge_sort
    expected = [@card_1, @card_3, @card_2, @card_6, @card_7, @card_5, @card_4]
    assert = expected, actual
  end
end
