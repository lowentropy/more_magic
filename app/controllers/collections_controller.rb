class CollectionsController < ApplicationController
  respond_to :html, :json
  
  expose(:collection) do
    Collection.only
  end
  
  def show
    respond_with collection
  end
  
end