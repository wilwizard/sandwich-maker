class Mailer

	extend MessageHelper

  def self.send(sandwich, password)
	  gmail = Gmail.connect(sandwich.sender, password)
		return false unless gmail.signed_in?

		email_body = compose_body(sandwich)
		receiver_email = sandwich.receiver
		quote_text = sandwich.quote

		email = gmail.compose do 
			to receiver_email
			subject "I have a favor to ask"
			body email_body
		end
		email.deliver!
	end
end
