class Spec < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :title, :value, :product
end
