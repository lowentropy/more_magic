class Deck < ActiveRecord::Base  
  belongs_to :collection
  has_many :copies
  
  scope :left_over, where(left_over: true)
  
  delegate :cards, :sideboard, to: :copies
end
