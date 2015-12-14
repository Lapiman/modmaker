class AddModidToMods < ActiveRecord::Migration
  def change
    add_column :mods, :modid, :string
  end
end
