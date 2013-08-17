class SandwichesController < ApplicationController

	include ApplicationHelper

	def new
		@sandwich = Sandwich.new
		@items = %w(turkey bacon ham roastbeef tomato lettuce pickles mustard mayo)
	end

	def create
		sandwich = Sandwich.create(:sender => params[:sender], 
															 :receiver => params[:receiver])
		@password = params[:password]
		send_email(sandwich, @password)
		redirect_to root_path
	end

	private

	def send_email(sandwich, password)
		gmail = Gmail.connect(sandwich.sender, password)
		email_body = "Please make me a sandwich\n\n" + get_quote
		email = gmail.compose do 
			to sandwich.receiver
			subject "I have a favor to ask"
			body email_body
		end
		email.deliver!
	end
end
