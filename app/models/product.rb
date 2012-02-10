class Product < ActiveRecord::Base
  has_many :specs
  belongs_to :category
  belongs_to :sub_category
  
  validates_presence_of :image_file_name, :pdf_file_name, :title, :category
  
  has_attached_file :image, :styles => { 
                                         :standard => "<455x190>", 
                                         :thumb => "<290x140>" 
                                        }
                                         
  has_attached_file :pdf
  
  
end
