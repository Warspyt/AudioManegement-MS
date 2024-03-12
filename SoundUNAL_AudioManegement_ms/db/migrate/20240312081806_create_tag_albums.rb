class CreateTagAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_albums do |t|
      t.integer :tagid
      t.integer :albumid

      t.timestamps
    end
  end
end
