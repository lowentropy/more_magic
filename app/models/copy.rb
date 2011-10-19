class Copy < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  belongs_to :deck
  belongs_to :card
  
  scope :sideboard, where(sideboard: true)
  scope :cards, where(sideboard: false)
  
  def price
    card.price! * count
  end
  
  class << self
    def find_by_description desc, set_map=nil
      case desc
      when /^#/ then nil
      when /^([0-9]+)x? (.*)$/
        new_by_name({count: $1.to_i, name: $2}, set_map)
      else
        new_by_name({count: 1, name: desc}, set_map)
      end
    end
    
    def new_by_name params, set_map=nil
      name = params.delete :name
      params[:card] = Card.find_by_name name, set_map
      raise "no such card: '#{name}'" unless params[:card]
      new({sideboard: false}.merge params)
    end
  end
  
  memoize :price
end
