class BrandsController < ApplicationController

  layout 'listing'

  # show all ads for current brand  
  def show
    @brand = Brand.find_by(brand_name: params[:brand_name])
    @ads = @brand.ads.all
    @types = @brand.types.all
  end

end
