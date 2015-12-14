class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :blockid
      t.string :name
      t.references :mod, index: true

      t.timestamps
    end
  end
end
