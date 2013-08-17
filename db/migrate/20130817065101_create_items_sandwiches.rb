class CreateItemsSandwiches < ActiveRecord::Migration

	def change
		create_table :items_sandwiches do |t|
			t.references :sandwich
			t.references :item
		end
	end
end
