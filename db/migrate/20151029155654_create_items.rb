class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemid
      t.string :name

      t.timestamps
    end
  end
end