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

  def test_that_the_current_card_is_the_first_one
    expected = @card_1
    actual = @round.current_card
    assert_equal expected, actual
  end

  def test_that_record_guess_method_returns_an_instance_of_guess_class
    actual = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, actual
  end

  def test_that_our_first_guess_is_stored_in_the_instance_variable_guesses
    @round.record_guess({value: "3", suit: "Hearts"})
    expected = 1
    actual = @round.guesses.count
    assert_equal expected, actual
  end

  def test_that_guesses_and_cards_are_compared_with_feedback_given
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Ace", suit: "Spades"})
    assert_equal "Correct", @round.guesses.first.feedback
    assert_equal "Incorrect", @round.guesses.last.feedback
  end

  def test_that_the_number_correct_method_returns_the_number_of_correct_guesses
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Ace", suit: "Spades"})
    actual = @round.number_correct
    assert_equal 1, actual
  end

  def test_that_the_percent_correct_method_returns_the_correct_percent_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Ace", suit: "Spades"})
    actual = @round.percent_correct
    assert_equal 50, actual
  end 
end
