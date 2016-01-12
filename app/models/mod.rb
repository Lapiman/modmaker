require 'erb'

class Mod < ActiveRecord::Base
	before_create :randomize_id
	has_many :items, dependent: :destroy
	has_many :blocks, dependent: :destroy
	
	private
	def randomize_id
		begin
			self.id = SecureRandom.random_number(1_000_000)
		end while Mod.where(id: self.id).exists?
	end
end
