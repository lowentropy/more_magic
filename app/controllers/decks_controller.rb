class DecksController < ApplicationController
  respond_to :html, :json
  
  expose :deck
  
  def show
    respond_with deck
  end
  
  def edit
    respond_with deck
  end
  
  def update
    if deck.save
      flash.now[:notice] = "Saved changes to deck."
    end
    render action: :show
  end
end