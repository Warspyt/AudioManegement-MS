class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.datetime :publicationDate
      t.text :lyrics
      t.integer :version
      t.integer :userid
      t.integer :audioid
      t.integer :albumid

      t.timestamps
    end
  end
end
