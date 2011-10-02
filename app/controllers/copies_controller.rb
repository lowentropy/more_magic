class CopiesController < ApplicationController
  respond_to :json
  
  expose :copy
  expose(:copies) { Copy.includes(:card) }
  
  def index
    respond_with copies, :include => :card
  end
  
  def update
    if copy.count == 0
      copy.destroy
    else
      copy.save
    end
    respond_with copy
  end
  
  def create
    copy.save
    respond_with copy
  end
end
    