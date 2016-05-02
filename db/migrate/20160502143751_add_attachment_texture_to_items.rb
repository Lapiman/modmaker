class AddAttachmentTextureToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :texture
    end
  end

  def self.down
    remove_attachment :items, :texture
  end
end
