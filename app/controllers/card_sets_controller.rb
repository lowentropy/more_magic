class CardSetsController < ApplicationController
  respond_to :json
  
  expose(:card_sets) { CardSet.scoped }
  
  def index
    respond_with card_sets
  end
end