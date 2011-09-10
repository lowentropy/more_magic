module CardsHelper
  def card_image_url card
    "http://magiccards.info/scans/en/#{card.card_set.code}/#{card.num}.jpg"
  end
end