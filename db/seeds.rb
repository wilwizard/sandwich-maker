# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Item.destroy_all
Sandwich.destroy_all

items = %w(turkey bacon ham roastbeef tomato lettuce pickles mustard mayo)

items.each do |item|
	Item.create(description: item)
end

