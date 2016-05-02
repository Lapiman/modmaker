class Item < ActiveRecord::Base
	belongs_to :mod

	has_attached_file :texture
	do_not_validate_attachment_file_type :texture
	# TODO come back to this! I know this ain't safe but I gotta get the damn thing running
end
