class AddCreativeTabToItems < ActiveRecord::Migration
  def change
    add_column :items, :creative_tabs, :string
  end
end
