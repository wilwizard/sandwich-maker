module ApplicationHelper

	def get_quote
		http = Typhoeus.get('http://www.iheartquotes.com/api/v1/random')
		quote = http.body.split("\n")
		quote.pop
		quote.join('')
	end

	def compose_body(sandwich)
		body = "Could you please make me a sandwich?\n\n"
		body << "I would like:\n"
		sandwich.items.each do |item|
			body << item.description + "\n"
		end
		body << "Thank you :)\n\n"
		body << sandwich.quote
		body
	end
end
