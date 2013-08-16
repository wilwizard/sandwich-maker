class Sandwich < ActiveRecord::Base	
	attr_accessible :sender, :receiver, :password

	before_create :validate_email

	private

	def validate_email
		connection = Gmail.connect(sender, password)
	end
end
