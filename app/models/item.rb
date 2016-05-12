class Item < ActiveRecord::Base
	belongs_to :mod

	has_attached_file :texture
	validates_attachment :texture, content_type: { content_type: "image/png" }
end
