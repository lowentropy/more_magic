require 'open-uri'

class CardSet < ActiveRecord::Base
  
  GathererCodes = Hash.new { |_,code|
    code.upcase
  }.merge!(
    'uh'    => 'UNH',
    'p3k'   => 'PK',
    'ud'    => 'CG',
    'ul'    => 'GU',
    'us'    => 'UZ',
    'po2'   => 'P2',
    'st2k'  => 'P4',
    '8e'    => '8ED',
    '9e'    => '9ED',
    'be'    => '2E',
    'ae'    => '1E',
    'rv'    => '3E',
    'un'    => '2U',
    'hl'    => 'HM',
    'lg'    => 'LE',
    '15ann' => '10E',
    'pot'   => 'PO',
    'ai'    => 'AL',
    'cs'    => 'CSP',
    '8eb'   => '8ED',
    'mgbc'  => 'VI',
    '9eb'   => '9ED',
    'lw'    => 'LRW',
    'mt'    => 'MOR',
    'mr'    => 'MI',
    'ds'    => 'DST',
    'ju'    => 'JUD',
    'tr'    => 'TOR',
    'on'    => 'ONS',
    'sc'    => 'SCG',
    'sh'    => 'ST',
    'tp'    => 'TE',
    'di'    => 'DIS',
    'gp'    => 'GPT',
    'dvd'   => 'DDC',
    'gvl'   => 'DDD',
    'jvc'   => 'DD2',
    'pvc'   => 'DDE',
    'fvd'   => 'DRB',
    'fve'   => 'V09',
    'fvr'   => 'V10',
    'pch'   => 'HOP',
    'pds'   => 'H09',
    'cfx'   => 'CON',
    'cstd'  => 'IA',
    'pc'    => 'PLC',
    'ts'    => 'TSP',
    'tsts'  => 'TSB',
    'fnmp'  => '6E',
    'mlp'   => nil,
    'at'    => nil,
    'sus'   => nil,
    'sum'   => nil,
    'ptc'   => nil,
    'rep'   => nil,
    'mss'   => nil,
    'mprp'  => nil,
    'jsr'   => nil,
    'grc'   => nil,
    'cp'    => nil,
    'arena' => nil,
    'ajs'   => nil,
    'dpa'   => nil,
    'apac'  => nil,
    'euro'  => nil,
    'guru'  => nil,
    'dcilm' => nil,
    'mbp'   => nil,
    'itp'   => nil,
    'uqc'   => nil,
    'gpx'   => nil,
    'mgdc'  => nil,
    'pro'   => nil,
    'hho'   => nil,
    'jr'    => nil,
    'dm'    => nil
  )
  
  default_scope order(:name).includes(:cards)
  
  belongs_to :card_group
  has_many :cards

  # Add accessors by set code
  all.each do |set|
    name = set.code.legal_name
    cattr_accessor name
    send "#{name}=", set
  end
  
  class << self
    def codes
      @@codes ||= all.map(&:code).sort.map(&:legal_name).map(&:to_sym)
    end
  
    def code_re
      @@code_re ||= codes.join('|')
    end
  end
  
  def gatherer_code
    GathererCodes[code.downcase]
  end
  
  def on_gatherer?
    !!gatherer_code
  end
  
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
