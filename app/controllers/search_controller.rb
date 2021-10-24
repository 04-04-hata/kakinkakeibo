class SearchController < ApplicationController
  
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model,@value)
  end
  
  private
  
  def partical(model, value)
    
    if model == 'gachakakeibo'
      GachaKakeibo.where("object LIKE ?", "%#{value}%")
    elsif model == 'otherkakeibo'
      OtherKakeibo.where("object LIKE ?", "%#{value}%")
    end
    
  end
  
  def search_for(model, value)
    
    partical(model, value)
    
  end
  
end
