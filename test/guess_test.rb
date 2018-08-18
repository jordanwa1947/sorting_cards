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

  def test_the_correct_method_compares_guesses_and_returns_false_without_match
    expected = false
    actual = @guess.correct?
    refute expected, actual
  end

  def test_the_correct_method_compares_guesses_and_returns_true_with_match
    card = Card.new("Ace", "Spades")
    guess = Guess.new("Ace of Spades", card)
    expected = true
    actual = guess.correct?
    assert expected, actual
  end

  def test_that_feedback_is_incorrect_based_on_correct_method_output
    expected = "incorrect"
    actual = @guess.feedback
    assert_equal expected, actual
  end

  def test_that_feedback_is_correct_based_on_correct_method_output
    card = Card.new("Ace", "Spades")
    guess = Guess.new("Ace of Spades", card)
    expected = "correct"
    actual = guess.feedback
    assert_equal expected, actual
  end
end
