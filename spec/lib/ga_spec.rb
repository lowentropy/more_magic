require 'spec_helper'
require 'ga'

describe GA do
    
  class TestChromo < Struct.new(:genes)
    def recombine other
      index = rand_index
      self.class.new genes[0,index] + other.genes[index..-1]
    end
    def fitness
      genes.sum
    end
    def mutate!
      genes[rand_index] = (rand * 2).to_i
    end
    def rand_index
      (rand * genes.size).to_i
    end
    def self.random
      self.new Array.new(20) { (rand * 2).to_i }
    end
  end
  
  let(:population) { Array.new(40) { TestChromo.random }}
  let(:ga) { GA.new :reproduction_rate => 0.4, :mutation_rate => 0.001 }
  
  before do
    ga.seed population
    ga.evolve 10000
  end
  
  specify { ga.best.fitness.should == 100 }
  
end