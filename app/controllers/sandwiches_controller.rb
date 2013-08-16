class SandwichesController < ApplicationController

	def new
		@sandwich = Sandwich.new
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
		email = gmail.compose do 
			to sandwich.receiver
			subject "I have a favor to ask"
			body "Please make me a sandwich"
		end
		email.deliver!
	end
end
