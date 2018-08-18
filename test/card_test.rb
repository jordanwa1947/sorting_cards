require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'


class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_that_the_card_has_a_value
    expected = "Ace"
    actual = @card.value
    assert_equal expected, actual
  end

  def test_that_the_card_has_a_suit
    expected = "Spades"
    actual = @card.suit
    assert_equal expected, actual
  end

  def
