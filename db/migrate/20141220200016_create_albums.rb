class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.integer :date
      t.string :cover_url

      t.timestamps
    end
    add_column :songs, :album_id, :integer
    add_column :songs, :url, :string

  end
end
