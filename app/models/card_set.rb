require 'open-uri'

class CardSet < ActiveRecord::Base
  
  default_scope order(:name).includes(:cards)
  
  belongs_to :card_group
  has_many :cards
  
  def refresh name
    puts "set: #{name}"
    update_attributes! name: name
    doc = Nokogiri::HTML open("http://magiccards.info/#{code}/en.html")
    doc.css('br+table tr').each do |row|
      cells = row.css('td').map(&:text).map(&:strip)
      num, name, type, mana, rarity, artist, edition = cells
      next unless name
      puts "card: #{name}"
      card = cards.find_or_create_by_num num
      card.update_attributes!(
        name: name,
        card_type: type,
        mana: mana,
        rarity: rarity,
        artist: artist
      )
    end
  end
end
