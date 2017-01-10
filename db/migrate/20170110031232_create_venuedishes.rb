class CreateVenuedishes < ActiveRecord::Migration
  def change
    create_table :venuedishes do |t|
      t.integer :venueid
      t.integer :dishid

      t.timestamps

    end
  end
end
