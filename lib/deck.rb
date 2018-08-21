require 'pry'
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @swap = false
  end

  def count
    cards.length
  end

  def sort
    convert_to_sort
    (cards.length - 1).times do
      @swap = false
      x = 1
      one_round(x)
      break if @swap == false
    end
    revert_back
  end

  def one_round(x)
    (cards.length - 1).times do
      same_value_cards(x)
      different_value_cards(x)
    x += 1
    end
  end

  def same_value_cards(x)
    if cards[x].value == cards[x - 1].value
      if cards[x].suit < cards[x - 1].suit
        cards[x], cards[x - 1] = cards[x - 1], cards[x]
        @swap = true
      end
    end
  end

  def different_value_cards(x)
    if cards[x].value < cards[x - 1].value
      cards[x], cards[x - 1] = cards[x - 1], cards[x]
      @swap = true
    end
  end

  def convert_to_sort
    array = []
    @cards.each do |card|
      if card.value == "Ace"
        array << card.value = "Lace"
      elsif  card.value == "Queen"
        array << card.value = "Keen"
      else
        array << card
      end
    end
  end

  def revert_back
    array = []
    @cards.each do |card|
      if card.value == "Lace"
        array << card.value = "Ace"
      elsif  card.value == "Keen"
        array << card.value = "Queen"
      else
        array << card
      end
    end
  end
end
