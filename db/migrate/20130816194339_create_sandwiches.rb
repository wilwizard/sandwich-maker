class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.string :sender
      t.string :password
      t.string :receiver
      t.string :quote
      t.timestamps
    end
  end
end
