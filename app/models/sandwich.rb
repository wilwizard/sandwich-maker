class Sandwich < ActiveRecord::Base	

	include ApplicationHelper

	attr_accessible :sender, :receiver

	has_and_belongs_to_many :items
	validates_presence_of :sender, :receiver
	after_create :add_quote

	def send_email(password)
		gmail = Gmail.connect(sender, password)
		return false unless gmail.signed_in?

		email_body = compose_body(self)
		receiver_email = receiver
		quote_text = quote

		email = gmail.compose do 
			to receiver_email
			subject "I have a favor to ask"
			body email_body
		end
		email.deliver!
	end

	def add_quote
		update_attribute(:quote, get_quote)		
	end

end
