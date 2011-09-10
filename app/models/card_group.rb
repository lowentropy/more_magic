require 'open-uri'

class CardGroup < ActiveRecord::Base
  
  default_scope order(:name).includes(card_sets: :cards)
  
  has_many :card_sets
  
  class << self
    def refresh
      doc = Nokogiri::HTML open("http://magiccards.info/sitemap.html")
      doc.css('a[name=en]+h2+table h3+ul>li').each do |li|
        group_name = li.children.first.text.strip
        group = find_or_create_by_name group_name
        group.refresh li
      end
    end
  end
  
  def refresh parent
    puts "group: #{name}"
    parent.css('li').each do |li|
      name = li.css('a').text.strip
      code = li.css('small').text.strip
      set = card_sets.find_or_create_by_code code
      set.refresh name
    end
 end
end
