module ApplicationHelper

	def full_title title
		if title.blank?
			"Raymond Cohen"
		else
			"#{title} | Raymond Cohen"
		end
	end
end
