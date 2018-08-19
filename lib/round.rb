require './lib/deck'
require './lib/guess'
require './lib/card'

class Round
  attr_reader :deck, :guesses
  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.shift
  end

  def record_guess(response_hash)
    array = response_hash.values
    one_guess = "#{array[0]} of #{array[1]}"
    @guesses << card_guess = Guess.new(one_guess, current_card)
    card_guess
  end

  def number_correct
    correct = @guesses.find_all { |guess| guess.correct?}
    correct.count
  end

  def percent_correct
<<<<<<< HEAD
    fraction = (number_correct.round(1) / @guesses.count)
=======
    fraction = (number_correct.to_f / @guesses.count)
>>>>>>> fbfa6222dae96c0b871ee33802c7dcd22d8af507
    (fraction *= 100).round
  end
end
