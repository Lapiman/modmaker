class BlockColumns < ActiveRecord::Migration
  def change
  	add_column :blocks, :max_stack_size, :string
  	add_column :blocks, :creative_tab, :integer
  	add_column :blocks, :hardness, :float
  	add_column :blocks, :step_sound, :integer
  	add_column :blocks, :harvest_tool, :integer
  	add_column :blocks, :harvest_level, :integer
  	add_column :blocks, :material, :integer
  	add_column :blocks, :light_level, :integer
  end
end
