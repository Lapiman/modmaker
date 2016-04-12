class AddMaxStackSizeToItems < ActiveRecord::Migration
  def change
    add_column :items, :max_stack_size, :integer
  end
end
