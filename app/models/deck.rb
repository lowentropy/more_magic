class Deck < ActiveRecord::Base  
  belongs_to :collection
  has_many :copies, :include => :card, :order => 'cards.name'
  
  scope :left_over, where(left_over: true)
  
  delegate :cards, :sideboard, to: :copies
  
  accepts_nested_attributes_for :copies
  
  def reset!
    copies.destroy_all
  end
  
  def num_cards
    cards.sum(:count)
  end
  
  def num_sideboard
    sideboard.sum(:count)
  end
  
  def import file
    set_map = {}
    reset!
    copies = file.split(/\n+/).map do |line|
      line.strip!
      puts(line) || next if line.empty? or line =~ /^#/
      Copy.find_by_description(line.strip, set_map).tap do |copy|
        raise "invalid line: #{line}" unless copy
      end
    end
    self.copies.concat copies.compact
    consolidate!
  end
  
  def consolidate!
    copies.group_by(&:card).each do |card, set|
      next if set.size == 1
      set.first.update_attributes! count: set.sum(&:count)
      set[1..-1].each &:destroy
    end
    save!
  end
end
