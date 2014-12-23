class PicturesController < ApplicationController
	before_action :authenticate, only: [:manage, :new, :edit, :destroy]
	# TODO by the way this DOES allow a malicious user to send POST requests
	# so do we need to include Create and Update in that?

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

	def manage
		@pictures = Picture.all.paginate(page: params[:page])
	end

	def destroy
		Picture.destroy(params[:id])
		flash[:success] = "Picture deleted."
		redirect_to '/gallery/manage'
	end

	private

		def picture_params
			params.require(:picture).permit(:url, :description, :image)
		end


end
