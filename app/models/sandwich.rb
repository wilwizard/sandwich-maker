class Sandwich < ActiveRecord::Base	

	include ApplicationHelper

	attr_accessible :sender, :receiver, :items
	validates_presence_of :sender, :receiver, :items

	def send_email(password)
		gmail = Gmail.connect(sender, password)
		return false unless gmail.signed_in?
		email_body = compose_body(self)
		receiver_email = receiver
		email = gmail.compose do 
			to receiver_email
			subject "I have a favor to ask"
			body email_body
		end
		email.deliver!
	end


end
