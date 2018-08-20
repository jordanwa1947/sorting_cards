require 'pry'
class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort
    (array.length - 1).times do
      x = 1
      (array.length - 1).times do
        if array[x] < array[x - 1]
          array[x], array[x - 1] = array[x - 1], array[x]
        end
      x += 1
      end
    end
  array
  end
end
