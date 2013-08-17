class SandwichesController < ApplicationController

	include ApplicationHelper

	def new
		@sandwich = Sandwich.new
		@items = %w(turkey bacon ham roastbeef tomato lettuce pickles mustard mayo)
	end

	def create
		items = ""
		params[:items].each do |item, value|
			items << item + ','
		end
		p items
		if sandwich = Sandwich.create(:sender => params[:sender], 
									:receiver => params[:receiver],
									:items => items)
			@password = params[:password]
			send_email(sandwich, @password)
		else
			flash[:error] = "something went wrong"
		end
		redirect_to root_path
	end

	private

	def send_email(sandwich, password)
		gmail = Gmail.connect(sandwich.sender, password)
		email_body = compose_body(sandwich)
		email = gmail.compose do 
			to sandwich.receiver
			subject "I have a favor to ask"
			body email_body
		end
		email.deliver!
	end
end
