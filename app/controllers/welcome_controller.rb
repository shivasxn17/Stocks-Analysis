class WelcomeController < ApplicationController

	def index
		
	end

	def home
		redirect_to welcome_index_path
	end

	def about
		
	end
end
