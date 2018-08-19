require './lib/deck'
require './lib/guess'
require './lib/card'
require 'pry'
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
end
