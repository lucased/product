class AlterProductAddCategoryId < ActiveRecord::Migration
  def up
    add_column :products, :category_id, :interger
  end

  def down
    remove_column :products, :category_id
  end
end
