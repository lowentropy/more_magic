class CopiesController < ApplicationController
  respond_to :json
  
  expose(:copies) { Copy.includes(:card) }
  
  def index
    respond_with copies, :include => :card
  end
end
    