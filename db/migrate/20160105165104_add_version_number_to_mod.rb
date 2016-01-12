class AddVersionNumberToMod < ActiveRecord::Migration
  def change
    add_column :mods, :version_number, :string
  end
end
