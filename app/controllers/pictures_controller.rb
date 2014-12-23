class PicturesController < ApplicationController

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		if @picture.save
			flash[:success] = "Image saved."
			redirect_to @picture
		else
			render 'new'
		end
	end

	def index
		@pictures = Picture.all.paginate(page: params[:page])
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes(picture_params)
			flash[:success] = "Updated entry."
			redirect_to @picture
		else
			render 'edit'
		end
	end

	private

		def picture_params
			params.require(:picture).permit(:url, :description, :image)
		end

end
