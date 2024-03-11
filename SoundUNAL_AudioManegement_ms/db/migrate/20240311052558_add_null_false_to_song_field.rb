class AddNullFalseToSongField < ActiveRecord::Migration[7.1]
  def change
      change_column_null :songs, :title, false
      change_column_null :songs, :publicationDate, false
      change_column_null :songs, :lyrics, false
      change_column_null :songs, :userid, false
      change_column_null :songs, :version, false
      change_column_null :songs, :audioid, false
      change_column_null :songs, :albumid, false
  end
end
