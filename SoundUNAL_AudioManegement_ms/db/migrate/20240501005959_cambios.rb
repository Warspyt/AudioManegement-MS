class Cambios < ActiveRecord::Migration[7.1]
  def change
    change_column :songs, :userid, :integer
    change_column :songs, :audioid, :string
  end
end
