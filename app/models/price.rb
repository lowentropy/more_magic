require 'open-uri'

class Price < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  belongs_to :card
  
  class << self
    def refresh_all!
      refresh_prices_for Card.includes(:price).all
    end
    def load_missing
      refresh_prices_for Card.includes(:price).all.reject(&:price)
    end
    def zero
      @zero ||= self.new(low: 0, mid: 0, high: 0)
    end
    private
    def refresh_prices_for cards
      cards.each_with_index do |card, i|
        puts "#{i+1}/#{cards.size} #{card}"
        card.price!.refresh!.save! rescue nil
      end
    end
  end
  
  def refresh!
    re = ': .*?\$(\d+\.\d\d).*'
    if response =~ /L#{re}M#{re}H#{re}/
      [:low, :mid, :high].each_with_index do |attr, i|
        self[attr] = $~[i+1].to_f
      end
    else
      puts "Can't parse result from tcgplayer.com:\n#{response}"
      raise "Can't parse result from tcgplayer.com:\n#{response}"
    end
    self
  end
  
  def + other
    self.class.new low:  (low + other.low),
                   mid:  (mid + other.mid),
                   high: (high + other.high)
  end
  
  def * scalar
    self.class.new low:  (low * scalar),
                   mid:  (mid * scalar),
                   high: (high * scalar)
  end
  
  def to_s
    "L: $#{low} M: $#{mid} H: $#{high}"
  end
  
private

  def response
    (io = open(url)).read.tap { io.close }
  end
  
  def base_url
    'http://partner.tcgplayer.com/syn/synhighlow.ashx?pk=MAGCINFO'
  end
  
  def url
    "#{base_url}&pi=#{card.card_set.code}-#{card.num}"
  end
  
  memoize :response
end
