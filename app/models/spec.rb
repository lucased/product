class Spec < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :title, :value, :product
  
  def text_description
    "#{self.title}: #{self.value}"
  end
end
