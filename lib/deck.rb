
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

  def revert_back
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

  def merge_sort
    two_arrays = two_lists
    merge(two_arrays[0], two_arrays[1])
    revert_back
  end

  def two_lists
    lists = make_lists
    two_arrays = lists.map do |card_array|
      merge(lists.shift, lists.shift)
    end
  end

  def make_lists
   convert_to_sort
   card_arrays = @cards.map { |card| [] << card }
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left[0].value == right[0].value
      if left[0].value < right[0].value
        [left[0]] + merge(left[1..left.length], right)
      else
        [right[0]] + merge(left, right[1..right.length])
      end
    elsif left[0].value < right[0].value
      [left[0]] + merge(left[1..left.length], right)
    else
      [right[0]] + merge(left, right[1..right.length])
    end
  end

end
