class Song < ActiveRecord::Base
	has_attached_file :track
	#	validates_attachment_content_type :track, content_type: ["audio/mpeg3", "audio/x-mpeg-3", "audio/m4a", "audio/mpeg"]
	validates_attachment :track, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", "audio/x-m4a", "video/mp4", "audio/mpeg"] }

	belongs_to :album

end
