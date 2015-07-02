class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.text :review
      t.string :image

      t.timestamps
    end
  end
end
