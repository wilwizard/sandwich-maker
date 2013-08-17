class Item < ActiveRecord::Base
  attr_accessible :description
  has_and_belongs_to_many :sandwiches
end
