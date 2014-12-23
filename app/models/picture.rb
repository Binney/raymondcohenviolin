class Picture < ActiveRecord::Base
	has_attached_file :image # TODO ought to have a proper size/style hash here? 
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
