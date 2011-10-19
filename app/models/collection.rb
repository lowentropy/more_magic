class Collection < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  has_many :decks,
    dependent: :destroy,
    conditions: {left_over: false}
  
  has_one :left_over,
    class_name: 'Deck',
    conditions: {left_over: true},
    dependent: :destroy
  
  after_create { create_left_over! }
  
  class << self
    def only
      first || create!
    end
  end
  
  def price
    decks.all.sum(Price.zero, &:price) + left_over.price
  end
  
  memoize :price
end
