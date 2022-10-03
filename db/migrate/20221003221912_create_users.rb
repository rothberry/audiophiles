class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :location
      t.text :bio
      t.string :fb_url
      t.string :tw_url
      t.string :sc_url

      t.timestamps
    end
  end
end
