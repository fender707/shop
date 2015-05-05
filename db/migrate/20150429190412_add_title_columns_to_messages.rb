class AddTitleColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :title, :string, limit: 30
  end
end
