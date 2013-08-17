class Sandwich < ActiveRecord::Base	
	attr_accessible :sender, :receiver, :items
	validates_presence_of :sender, :receiver
	
end
