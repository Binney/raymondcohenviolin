module AlbumsHelper

	def cover_for album
		if album.cover_url.blank?
			"default_covers/cover#{album.id % 4}.png"
		else
			album.cover_url
		end
	end
end
