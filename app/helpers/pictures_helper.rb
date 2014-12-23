module PicturesHelper

	def image_url_for picture
		if picture.image.url.blank?
			picture.url
		else
			picture.image.url
		end
	end

end
