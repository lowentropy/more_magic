class Card < ActiveRecord::Base
  default_scope order(:num)
  
  belongs_to :card_set
  belongs_to :deck
  
  delegate :card_group, to: :card_set
  delegate :collection, to: :deck
end
