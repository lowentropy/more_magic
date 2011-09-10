class CardsController < ApplicationController
  
  respond_to :html, :json
  
  expose(:card)
  expose(:card_groups) { CardGroup.scoped }
  expose(:cards) { Card.scoped }
  
  expose(:query) { params[:q] }
  expose(:search_results) { cards.where("name LIKE ?", "%#{query}%") }
  
  def index
    respond_with card_groups
  end
  
  def show
    respond_with card
  end
  
  def search
    respond_with search_results
  end

end
