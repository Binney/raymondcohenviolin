class SongsController < ApplicationController

	BUCKET = 'binneymusic'

  def index
  	#@songs = AWS::S3::Bucket.find(BUCKET).objects
  	@songs = Song.all
  end

  def show
    # TODO possibly remove this ultimately as should only be able to play from Album view
    @song = Song.find(params[:id])
  end

  def new
  	@song = Song.new
  end

  def create
  	@song = Song.new(song_params)

  	if @song.save
  		flash[:success] = "Song was successfully saved."
  		redirect_to @song
  	else
  		render 'new'
  	end

  end

  def edit
  	@song = Song.find(params[:id])
  end

  def update

  end

  private

  def song_params
    params.require(:song).permit(:track, :title, :composer_id, :date, :description, :url, :album_id)
  end

end
