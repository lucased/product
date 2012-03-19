# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Category.delete_all
["Jibs & Cranes", "Remote Heads", "Dollies & Tracks", "Vehicles", "Mounts & Risers"].each do |category|
  Category.create(:name => category)
end

SubCategory.delete_all

{"Jibs & Cranes" => ["Mini-Jib", "Jimmy Jib Triangle", "Jimmy Jib Tube", "Jumbo"], 
"Remote Heads" => [],
"Dollies & Tracks" => [],
"Vehicles" => [],
"Accessories" => [] }.each do |key, values|
  category = Category.find_by_name key 
  values.each do |value|
    SubCategory.create(
    :name => value, 
    :category => category
    ) 
  end
end


Product.delete_all

Product.create(
  :image_file_name => "../spec/fixtures/cam.jpg",
  :pdf_file_name => "../spec/fixtures/machine.pdf",
  :title => "Camera",             
  :description => "Big Camera",
  :category => Category.find_by_name("Jibs & Cranes")
)
      
      
    