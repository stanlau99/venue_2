class CreateDishesbyvenues < ActiveRecord::Migration
  def change
    create_table :dishesbyvenues do |t|
      t.integer :venueid
      t.integer :dishid

      t.timestamps

    end
  end
end
