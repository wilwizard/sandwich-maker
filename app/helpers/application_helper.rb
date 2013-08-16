module ApplicationHelper

	def get_quote
		http = Typhoeus.get('http://www.iheartquotes.com/api/v1/random')
		quote = http.body.split("\n")
		quote.pop
		quote.join('')
	end
end
