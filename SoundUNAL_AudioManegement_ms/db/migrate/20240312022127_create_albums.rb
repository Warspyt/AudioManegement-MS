class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.integer :userid

      t.timestamps
    end
  end
end
