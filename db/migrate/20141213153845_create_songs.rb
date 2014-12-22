class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :composer_id
      t.text :description
      t.integer :date

      t.timestamps
    end
    add_attachment :songs, :track
  end
end
