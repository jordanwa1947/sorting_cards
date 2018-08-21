class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end
# insertion sort
  def sort
    convert_to_sort
    (cards.length - 1).times do
      x = 1
      first_round(x)
    end
    convert_back
  end

  def first_round(x)
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
      end
    end
  end

  def different_value_cards(x)
    if cards[x].value < cards[x - 1].value
      cards[x], cards[x - 1] = cards[x - 1], cards[x]
    end
  end

  def convert_to_sort
    cards.map do |card|
      if card.value == "Ace"
        card.value = "Lace"
      elsif card.value == "Queen"
        card.value = "Keen"
      else
        card.value
      end
    end
  end

  def convert_back
    cards.map do |card|
      if card.value == "Lace"
        card.value = "Ace"
      elsif card.value == "Keen"
        card.value = "Queen"
      else
        card.value
      end
    end
  return cards
  end
end
