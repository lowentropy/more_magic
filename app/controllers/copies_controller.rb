class CopiesController < ApplicationController
  respond_to :json
  
  expose :copy
  expose(:copies) { Copy.includes(:card) }
  
  def index
    respond_with copies, :include => :card
  end
  
  def update
    copy.save
    respond_with copy
  end
end
    