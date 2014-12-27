class StaticPagesController < ApplicationController

	def home
		@homepage = true
		@pictures = Picture.all.order('created_at DESC')[0..4]
	end

	def about
	end

	def biography
	end

	def contact
	end

end
