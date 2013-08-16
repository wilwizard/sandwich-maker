class SandwichesController < ApplicationController

	def new
		@sandwich = Sandwich.new
	end

	def create
		Sandwich.create(params[:sandwich])
		redirect_to root_path
	end

end
