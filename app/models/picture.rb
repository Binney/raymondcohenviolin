class Picture < ActiveRecord::Base
	has_attached_file :image,   # TODO ought to have a proper size/style hash here? 
		storage: :s3,
		styles: {thumb: '940x150>'},
		path: ":attachment/:id/:style.:extension",
  		bucket: "binneybucket",
  		s3_credentials: { bucket: "ENV['S3_BUCKET_NAME']",
      					  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      					  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
