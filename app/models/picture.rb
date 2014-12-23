class Picture < ActiveRecord::Base
	has_attached_file :image,   # TODO ought to have a proper size/style hash here? 
		storage: :s3,
		path: ":attachment/:id/:style.:extension",
  		bucket: "binneybucket",
  		s3_credentials: "#{Rails.root}/config/s3.yml"

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
