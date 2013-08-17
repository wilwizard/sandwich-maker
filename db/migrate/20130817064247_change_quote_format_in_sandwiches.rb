class ChangeQuoteFormatInSandwiches < ActiveRecord::Migration

	def change
		change_column :sandwiches, :quote, :text
	end
end
