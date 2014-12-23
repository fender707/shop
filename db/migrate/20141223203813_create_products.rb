class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :count
      t.decimal :price
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
