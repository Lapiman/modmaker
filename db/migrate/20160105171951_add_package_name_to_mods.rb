class AddPackageNameToMods < ActiveRecord::Migration
  def change
    add_column :mods, :package_name, :string
  end
end
