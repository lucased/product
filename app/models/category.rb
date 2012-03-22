class Category < ActiveRecord::Base
  has_many :sub_categories
  has_many :products
  
  def has_sub_categories?
    self.sub_categories.length > 0
  end
  
end
