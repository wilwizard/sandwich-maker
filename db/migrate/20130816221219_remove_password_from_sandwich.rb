class RemovePasswordFromSandwich < ActiveRecord::Migration
  def change
    remove_column :sandwiches, :password
  end
end
