class AddAttachmentTextureToBlocks < ActiveRecord::Migration
  def self.up
    change_table :blocks do |t|
      t.attachment :texture
    end
  end

  def self.down
    remove_attachment :blocks, :texture
  end
end
