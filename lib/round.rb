require './lib/deck'
require './lib/guess'
require './lib/card'
require 'pry'
class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def guesses
    guesses = []
  end
end
