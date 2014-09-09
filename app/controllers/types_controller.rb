class TypesController < ApplicationController

layout 'listing'

  # show all ads for selected model (type) 
  def show
  	@brand = Brand.find_by(brand_name: params[:brand_name])
	@types = @brand.types.all
    @model = Type.find_by(model_name: params[:model_name])
    @ads = @model.ads.all

  end
  
end
