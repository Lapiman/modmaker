class AddDescriptionToMods < ActiveRecord::Migration
  def change
    add_column :mods, :description, :string
  end
end
