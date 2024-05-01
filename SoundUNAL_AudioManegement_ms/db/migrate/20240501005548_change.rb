class Change < ActiveRecord::Migration[7.1]
  def change
    change_column :songs, :userid, :string
  end
end
