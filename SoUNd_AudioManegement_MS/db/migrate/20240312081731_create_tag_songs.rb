class CreateTagSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_songs do |t|
      t.integer :tagid
      t.integer :songid

      t.timestamps
    end
  end
end
