module CardsHelper
  def card_image_url card
    "http://magiccards.info/scans/en/#{card.card_set.code}/#{card.num}.jpg"
  end
  
  def card_set_url card
    set_image_url card.card_set, rarity: card.rarity
  end
  
  def card_set_image card
    return '' unless card.card_set.on_gatherer?
    alt = "#{card.card_set.name} (#{card.rarity})"
    image_tag card_set_url(card), alt: alt, title: alt
  end
  
  def card_image card, opts={}
    size = opts[:size] || 'large'
    css = "#{opts[:class]} card #{size}"
    alt = card.name
    image_tag card_image_url(card), alt: alt, title: alt, class: css
  end
  
  def card_back_image_url
    'http://www.wizards.com/magic/images/mtgcom/fcpics/making/mr224_back.jpg'
  end
  
  def symbol_image_url symbol, opts={}
    size = opts[:size] || 'small'
    "http://gatherer.wizards.com/Handlers/Image.ashx?size=#{size}&name=#{symbol}&type=symbol"
  end
  
  def set_image_url set, opts={}
    size = opts[:size] || 'small'
    rarity = (opts[:rarity] || 'Common')[0,1].upcase
    rarity = 'C' if rarity == 'S' # specials become commons
    set = set.gatherer_code
    "http://gatherer.wizards.com/Handlers/Image.ashx?type=symbol&set=#{set}&size=#{size}&rarity=#{rarity}"
  end
end