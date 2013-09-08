class Sandwich < ActiveRecord::Base	

	attr_accessible :sender, :receiver

	has_and_belongs_to_many :items
	validates_presence_of :sender, :receiver
	after_create :add_quote


	private

	def add_quote
		update_attribute(:quote, get_quote)		
	end

	def get_quote
		http = Typhoeus.get('http://www.iheartquotes.com/api/v1/random')
		quote = http.body.split("\n")
		quote.pop
		quote.join('')
	end

end
