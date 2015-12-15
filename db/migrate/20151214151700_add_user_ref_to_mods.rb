class AddUserRefToMods < ActiveRecord::Migration
  def change
    add_reference :mods, :user, index: true
  end
end
