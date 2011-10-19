class Card < ActiveRecord::Base
  belongs_to :card_set
  belongs_to :deck
  has_one :price
  
  delegate :card_group, to: :card_set
  delegate :collection, to: :deck
  
  extend ActiveSupport::Memoizable
  
  class << self
    def categories
      [:creature, :sorcery, :enchantment, :instant]
    end
    
    def find_by_name name, set_map=nil
      name, set = $1, $2 if name =~ /^(.*?) (#{CardSet.code_re})$/
      set = CardSet.find_by_code(set) || raise("invalid set: #{set}") if set
      set ||= set_map[name]
      set_map[name] = set
      scope = where("name LIKE ?", name)
      scope = scope.where(:card_set_id => set.id) if set
      scope.first
    end
  end
  
  categories.each do |category|
    scope category, where("card_type LIKE ?", "%#{category}%")
  end
  
  def other_versions
    card_set.
      cards.
      where(name: name, :id.not_eq => id)
  end
  
  def other_editions
    Card.
      joins(:card_set).
      where(name: name, :id.not_eq => id).
      order(card_set: :name).
      group(:card_set_id)
  end
  
  SINGLE_MANA_RE = /[2-9]|1[0-4]?|[BWRGU]P?|[XYZ]/
  MANA_RE = /0|#{SINGLE_MANA_RE}|{(?:#{SINGLE_MANA_RE})}|{(?:#{SINGLE_MANA_RE})\/(?:#{SINGLE_MANA_RE})}/
  
  def mana_symbols
    mana.scan(MANA_RE).map do |sym|
      sym.gsub(/[^a-zA-Z0-9]+/, '')
    end.compact
  end
  
  def converted_mana_cost
    mana_symbols.sum do |symbol|
      if symbol.to_i != 0
        symbol.to_i
      else
        1
      end
    end
  end
  
  def to_s
    "#{name} (#{card_set.code})"
  end
  
  def price!
    price || build_price
  end

  alias :cmc :converted_mana_cost
  
  memoize :mana_symbols, :converted_mana_cost, :other_versions, :other_editions
end
