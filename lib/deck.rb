require './lib/card.rb'
class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort
    convert_to_sort
    (cards.length - 1).times do
      x = 1
      (cards.length - 1).times do
        if cards[x].value == cards[x - 1].value
          if cards[x].suit < cards[x - 1].suit
            cards[x], cards[x - 1] = cards[x - 1], cards[x]
          end
        end
        if cards[x].value < cards[x - 1].value
          cards[x], cards[x - 1] = cards[x - 1], cards[x]
        end
      x += 1
      end
    end
    convert_back
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
      array
    end
  end

  def convert_back
    array = []
    @cards.each do |card|
      if card.value == "Lace"
        array << card.value = "Ace"
      elsif  card.value == "Keen"
        array << card.value = "Queen"
      else
        array << card
      end
      array
    end
  end
end

card_1 = Card.new("Queen","Hearts")
card_2 = Card.new("Ace", "Clubs")
card_3 = Card.new("King", "Diamonds")
card_4 = Card.new("Jack", "Spades")
card_5 = Card.new("Ace", "Diamonds")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
p deck.sort
