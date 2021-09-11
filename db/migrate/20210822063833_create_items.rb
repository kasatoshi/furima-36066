class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :product_name
      t.text :description
      t.integer :category_id
      t.integer :product_condition_id
      t.integer :shipping_cost_id
      t.integer :delivery_id
      t.integer :shipping_day_id
      t.integer :price
      t.timestamps
    end
  end
end
