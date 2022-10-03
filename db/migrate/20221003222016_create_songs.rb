class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
