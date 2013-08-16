class Sandwich < ActiveRecord::Base	
	attr_accessible :sender, :receiver, :password
	validates_presenc

	before_create :send_email

	private

	def send_email
		gmail = Gmail.connect(sender, password)
		receiver_email = receiver
		email = gmail.compose do 
			to receiver_email
			subject "I have a favor to ask"
			body "Please make me a sandwich"
		end
		email.deliver!
	end
end
