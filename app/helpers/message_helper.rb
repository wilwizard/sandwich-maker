module MessageHelper

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
