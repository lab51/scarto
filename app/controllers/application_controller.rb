class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	# in index we show promoted ads - for now there are some random ads
  	# in the future they might be ads which are promoted
  	@ad_extra = Ad.find_by_brand_id(1)
  	@ads10 = Ad.where("price <= ?", 10000)
    @ads20 = Ad.where("price <= ?", 20000).where("price > ?", 10000)
    @ads100 = Ad.where("price > ?", 20000)
  end

  #show page /o-stronie
  def about
  end
  
end
