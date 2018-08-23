
class Guess
  attr_reader :response, :card
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    card_array = response.partition(' of ')
    if card_array[0] == @card.value and card_array[2] == @card.suit
      return true
    else
      return false
    end
  end

  def feedback
    if correct? == true
      "Correct"
    else
      "Incorrect"
    end
  end
end
