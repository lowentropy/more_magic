class CopiesController < ApplicationController
  respond_to :json, :include => :card
  
  expose(:copies) { Copy.includes(:card) }
  
  def index
    respond_with copies
  end
end
    