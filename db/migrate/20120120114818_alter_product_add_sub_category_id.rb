class AlterProductAddSubCategoryId < ActiveRecord::Migration
  def up
     add_column :products, :sub_category_id, :integer
   end

   def down
     remove_column :products, :sub_category_id
   end
end
