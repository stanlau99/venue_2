class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :userid
      t.integer :dishid
      t.integer :venueid

      t.timestamps

    end
  end
end
