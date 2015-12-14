class AddModIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :mod_id, :integer
  end
end
