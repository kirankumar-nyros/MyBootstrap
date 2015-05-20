class Product < ActiveRecord::Base
  attr_accessible :description, :price, :prid, :quantity, :title, :total, :vat
  validates :title, length: {in: 2..10 }
  validates :description, length: {in: 10..60}
  
end
