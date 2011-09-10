class Collection < ActiveRecord::Base
  has_many :decks,
    dependent: :destroy,
    conditions: {left_over: false}
  
  has_one :left_over,
    class_name: 'Deck',
    conditions: {left_over: true},
    dependent: :destroy
  
  after_create { create_left_over! }
end
