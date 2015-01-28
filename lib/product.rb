class Product < ActiveRecord::Base
  validates(:description, :presence => true)
  belongs_to(:purchase)
end
