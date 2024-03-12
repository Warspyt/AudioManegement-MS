class CreateSongPlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :song_playlists do |t|
      t.integer :playlistid
      t.integer :songid

      t.timestamps
    end
  end
end
