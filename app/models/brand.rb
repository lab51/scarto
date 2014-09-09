class Brand < ActiveRecord::Base
  has_many :types
  has_many :ads
end
