class Block < ActiveRecord::Base
	belongs_to :mod

	enum harvest_tool: [:pickaxe, :axe, :shovel]

	has_attached_file :texture
	validates_attachment :texture, content_type: { content_type: "image/png" }
end
