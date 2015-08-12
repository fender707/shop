class AddCountryIdAndStateIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :country_id, :integer
    add_column :orders, :state_id, :integer
  end
end
