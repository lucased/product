class Product < ActiveRecord::Base
  has_many :specs
  belongs_to :category
  belongs_to :sub_category

  validates_presence_of :image_file_name, :title, :category
  
  validates_attachment_content_type :pdf, :content_type =>['application/pdf']

  has_attached_file :image, 
  :styles => { 
    :standard => "<550>", 
    :thumb => "<290x140>" 
    },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"

    has_attached_file :pdf,
    :storage => :s3,
    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
    :path => "/userpdfs/:id/:basename.:extension"

    delegate :sub_category_name, :to => :sub_category


  end
