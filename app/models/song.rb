class Song < ActiveRecord::Base
	#has_attached_file :track
	#	validates_attachment_content_type :track, content_type: ["audio/mpeg3", "audio/x-mpeg-3", "audio/m4a", "audio/mpeg"]
	has_attached_file :track,   # TODO ought to have a proper size/style hash here? 
		storage: :s3,
		path: ":attachment/:id/:style.:extension",
  		bucket: "binneybucket",
  		s3_credentials: { bucket: ENV['S3_BUCKET_NAME'],
      					  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      					  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }	#validates_attachment :track, content_type: { content_type: ["audio/mp3", "audio/x-mpeg-3", "audio/x-m4a", "video/mp4", "audio/mpeg"] }
	do_not_validate_attachment_file_type :track
	
	belongs_to :album

end
