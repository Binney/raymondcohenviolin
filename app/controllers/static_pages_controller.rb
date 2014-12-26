class StaticPagesController < ApplicationController

	def home
		@homepage = true
		@disable_container = true
	end

	def about
	end

	def biography
	end

	def contact
	end

end
