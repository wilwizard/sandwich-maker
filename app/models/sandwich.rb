class Sandwich < ActiveRecord::Base	
	attr_accessible :sender, :receiver, :password
	validates_presence_of :sender, :receiver

end
