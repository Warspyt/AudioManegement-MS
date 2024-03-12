class CreateContributors < ActiveRecord::Migration[7.1]
  def change
    create_table :contributors do |t|
      t.integer :playlistid
      t.integer :userid

      t.timestamps
    end
  end
end
