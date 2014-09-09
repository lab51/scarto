class Type < ActiveRecord::Base
  belongs_to :brand
  has_many :ads
end
