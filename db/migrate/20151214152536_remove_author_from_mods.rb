class RemoveAuthorFromMods < ActiveRecord::Migration
  def change
    remove_column :mods, :author, :string
  end
end
