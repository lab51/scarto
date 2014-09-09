module AdsHelper
  
  #list years in select form
  def list_years 
   years = Array.new
    for z in (Time.now.year).downto(1900)
      years.push(z)
    end
    return years
  end
  
end
