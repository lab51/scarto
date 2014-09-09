class AdImage < ActiveRecord::Base
  belongs_to :ad

#  validates_format_of :image1, :with => %r{\.(png|jpg|jpeg)$}i 
#dodac walidacje rozszerzenia plikow

    
end
