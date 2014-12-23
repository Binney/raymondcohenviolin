class AlbumsController < ApplicationController
	before_action :authenticate, only: [:manage, :new, :edit, :destroy]

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			flash[:success] = "Album saved."
			redirect_to @album
		else
			render 'new'
		end
	end

	def index
		@albums = Album.all.paginate(page: params[:page])
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update_attributes(album_params)
			flash[:success] = "Updated entry."
			redirect_to @album
		else
			render 'edit'
		end
	end

	def manage
		@albums = Album.all.paginate(page: params[:page])
	end

	def destroy
		Album.destroy(params[:id])
		flash[:success] = "Album deleted."
		redirect_to '/music/manage'
	end

	private

		def album_params
			params.require(:album).permit(:name, :description, :date, :cover_url, songs_attributes: [:id, :title, :description, :date, :url, :composer_id])
		end

end
