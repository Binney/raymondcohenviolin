class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :default_music

	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			username == "anthya" && password == "symphony"
		end
	end

	def disable_container
		@disable_container = true
	end

	def default_music
		@song = Song.first(offset: Random.rand(Song.count))
	end

end
