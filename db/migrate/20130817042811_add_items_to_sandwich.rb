class AddItemsToSandwich < ActiveRecord::Migration
  def change
  	add_column :sandwiches, :items, :string
  end
end
