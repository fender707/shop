class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :image
      t.text   :review

      t.timestamps
    end
  end
end




