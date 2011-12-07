class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :title
      t.string :value
      t.integer :product_id
      t.timestamps
    end
  end
end
