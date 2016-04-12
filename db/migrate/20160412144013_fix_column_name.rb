class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :items, :creative_tabs, :creative_tab
  end
end
