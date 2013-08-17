class SandwichesController < ApplicationController

	include ApplicationHelper

	def new
		@items = Item.all
	end

	def create
		@sandwich = Sandwich.new
		@password = params[:password]
		@sandwich.sender = params[:sender]
		@sandwich.receiver = params[:receiver]


		if params[:items]
			params[:items].each do |item, value|
				item = Item.find_or_create_by_description(item)
				@sandwich.items << item
			end
		else
			flash[:error] = "Please select some items for your sandwich"
		end

		if @sandwich.save			
			if @sandwich.send_email(@password)
				flash[:message] = "Sandwich is on its way"
			else
				flash[:error] = "Email didn't send"
			end
		else
			flash[:error] = "Please fill out everything"
		end
		redirect_to root_path
	end

end
