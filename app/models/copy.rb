class Copy < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card
  
  scope :sideboard, where(sideboard: true)
  scope :cards, where(sideboard: false)
end
