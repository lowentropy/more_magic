class CardsController < ApplicationController
  
  respond_to :html, :json
  
  expose(:card)
  expose(:card_groups) { CardGroup.scoped }
  expose(:cards) { Card.scoped }
  
  expose(:query) { params[:q] }
  
  expose(:search_results) do
    cards.
      group(:name).
      order("length(name)", :name).
      where("name LIKE ?", like_clause)
  end
  
  def index
    respond_with card_groups
  end
  
  def show
    respond_with card
  end
  
  def search
    respond_with search_results
  end
  
  def set_examples
    respond_with card_groups
  end

private

  def like_clause
    "%#{query.split('').join('%')}%"
  end

end
