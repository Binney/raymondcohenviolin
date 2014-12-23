class Song < ActiveRecord::Base
	#has_attached_file :track
	#	validates_attachment_content_type :track, content_type: ["audio/mpeg3", "audio/x-mpeg-3", "audio/m4a", "audio/mpeg"]
	has_attached_file :track,   # TODO ought to have a proper size/style hash here? 
		storage: :s3,
		path: ":attachment/:id/:style.:extension",
  		bucket: "binneybucket",
  		s3_credentials: "#{Rails.root}/config/s3.yml"
	validates_attachment :track, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", "audio/x-m4a", "video/mp4", "audio/mpeg"] }

	belongs_to :album

end
