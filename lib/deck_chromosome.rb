class DeckChromosome
  attr_reader :lands, :cards
  def initialize colors, lands, cards, max_cards
    @colors, @lands, @cards = colors, lands, cards
    @max_cards = max_cards
    @mutate_lands_prob = 0.1
    @max_land_mutation = 3
    @min_size = 60
  end
  def mutate!
    if rand < @mutate_lands_prob
      mutate_random_land!
    else
      mutate_random_card!
    end
  end
  def fitness
    # TODO
  end
  def recombine other
    new_lands = splice @lands, other.lands
    new_cards = splice @cards, other.cards
    self.class.new @colors, new_lands, new_cards, @max_cards
  end
private
  def mutate_random_land!
    index = (rand * @lands.size).to_i
    until_valid do
     diff = ((rand * 2 - 1) * @max_land_mutation).to_i
     @lands[index] += diff
     @size += diff
   end
  end
  def mutate_random_card!
    index = (rand * @cards.size).to_i
    until_valid do
      count = (rand * (@max_cards[index] + 1)).to_i
      diff = count - @cards[index]
      @cards[index] = count
      @size += diff
    end
  end
  def until_valid
    yield
    yield until valid?
  end
  def valid?
    @size >= @min_size
  end
  def splice arr1, arr2
    raise "size mismatch" unless arr1.size == arr2.size
    index = (rand * arr1.size).to_i
    arr1[0,index] + arr2[index..-1]
  end
end