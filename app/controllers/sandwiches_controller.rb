class SandwichesController < ApplicationController

	include ApplicationHelper

	def new
		@sandwich = Sandwich.new
		@items = %w(turkey bacon ham roastbeef tomato lettuce pickles mustard mayo)
	end

	def create
		items = ""
		if params[:items]
			params[:items].each do |item, value|
				items << item + ','
			end
		else
			flash[:error] = "Please select some items for your sandwich"
		end
		@password = params[:password]
		if sandwich = Sandwich.create(:sender => params[:sender], 
									:receiver => params[:receiver],
									:items => items)
			if sandwich.send_email(@password)
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
