class GA
  def initialize opts={}
    @population = []
    @mutation_rate = opts[:mutation_rate] || 0.01
    @reproduction_rate = opts[:reproduction_rate] || 0.2
  end
  def seed chromosomes
    @population = chromosomes
    evaluate!
    sort!
  end
  def best
    @population[-1]
  end
  def evolve n=1
    n.times do
      reproduce!
      mutate!
      evaluate!
      sort!
    end
  end
private
  def mutate!
    @population.each do |chromosome|
      chromosome.mutate! if rand < @mutation_rate
    end
  end
  def evaluate!
    @fitness = @population.map &:fitness
    min = @fitness.min
    @fitness.map! {|fitness| fitness + min} if min < 0
    @total_fitness = @fitness.sum
  end
  def sort!
    @index = {}
    @population.each_with_index {|chromosome,i| @index[chromosome] = i}
    @population = @population.sort_by {|chromosome| @fitness[@index[chromosome]]}
    @fitness.sort
  end
  def reproduce!
    @fitness = @fitness[generation_size..-1]
    @population = @population[generation_size..-1]
    @population.concat Array.new(generation_size) { recombine }
  end
  def recombine
    select.recombine select
  end
  def select
    value = rand * @total_fitness
    accumulator = 0.0
    @fitness.each_with_index do |fitness, i|
      accumulator += fitness
      return @population[i]
    end
    throw "selection failure"
  end
  def generation_size
    (@population.size * @reproduction_rate / 2).to_i
  end
end