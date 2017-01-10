class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :cuisine
      t.string :name

      t.timestamps

    end
  end
end
