class Poker
  attr_reader :hands

  def initialize(cards)
    @hands = []
    cards.each{|deal| @hands<<Hand.new(deal)}
  end

  def best_hand
    top_score = hands.map {|hand| hand.hand_value[0]}.max
    winners = hands.select.with_index {|hand, i| hand.hand_value[0]==top_score}
    winners = break_tie(winners) if winners.count>1
    winners.map{|winner| winner.cards}
  end

  def break_tie(winners, index=1)
    return winners if winners[0].hand_value[index]==nil
    if winners[0].hand_value[index] > winners[1].hand_value[index]
      return [winners[0]]
    elsif winners[1].hand_value[index] > winners[0].hand_value[index]
      return [winners[1]]
    else
      break_tie(winners, index+=1)
    end
  end
end

class Hand
  attr_reader :cards, :card_values, :hand_value

  def initialize(cards)
    @cards = cards
    @card_values = sort_hand(cards)
    @flush = is_flush?(cards)
    @hand_value = Evaluator.new(card_values, @flush).value
  end

  def sort_hand(cards)
    sorted = cards.map{|card| CARD_VALUES[card[0]]}.sort
    sorted == [2,3,4,5,14] ? [1,2,3,4,5] : sorted
  end

  def is_flush?(cards)
    cards.map{|card| card[-1]}.uniq.count==1
  end

  CARD_VALUES = {"A"=>14, "K"=>13, "Q"=>12, "J"=>11, "1"=>10, "9"=>9, "8"=>8,
    "7"=>7, "6"=>6, "5"=>5, "4"=>4, "3"=>3, "2"=>2}
end

class Evaluator
  attr_reader :cards, :flush, :pairs, :value

  def initialize(cards, flush)
    @cards = cards
    @flush = flush
    @pairs = {}
    cards.uniq.each{|card| pairs[card]=cards.count(card)}
    @value = hand_values[check_for_pairs].flatten
  end

  def check_for_pairs
    if pairs.count==2
      pairs.values.sort == [2,3] ? :full_house : :four_of_a_kind
    elsif pairs.count==3
      pairs.values.sort == [1,2,2] ? :two_pair : :three_of_a_kind
    elsif pairs.count==4
      :one_pair
    else
      check_for_straight_and_flush
    end
  end

  def remainder
    pairs.select {|card, num| num==1}.keys.sort.reverse
  end

  def pair
    pairs.select {|card, num| num==2}.keys.sort.reverse
  end

  def trio
    pairs.select {|card, num| num==3}.keys
  end

  def square
     pairs.select {|card, num| num==4}.keys
  end

  def check_for_straight_and_flush
    if cards[0..3].all? {|card| card+1==cards[cards.index(card)+1]}
      flush ? :straight_flush : :straight
    else
      flush ? :flush : :high_card
    end
  end

  def hand_values
    {:high_card=>[0, remainder], :one_pair=>[1, pair, remainder],
    :two_pair=>[2, pair.first, pair.last, remainder], :three_of_a_kind=>[3, trio, remainder],
    :straight=>[4, remainder], :flush=>[5, remainder], :full_house=>[6, trio, pair],
    :four_of_a_kind=>[7, square, remainder], :straight_flush=>[8, remainder]}
  end
end
