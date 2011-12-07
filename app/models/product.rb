class Product < ActiveRecord::Base
  has_many :specs
  
  validates_presence_of :image_url, :pdf_url, :title
  validates :specs, :length => { :minimum => 1 }
  
  has_attached_file :image, :styles => { 
                                         :standard => "<455x190>", 
                                         :thumb => "<290x140>" 
                                        }
                                         
  has_attached_file :pdf
end
