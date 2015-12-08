class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :password
      t.text :address
      t.string :avatar_img
      t.text :aboutme
      t.string :facebook_url
      t.string :twitter_url
      t.boolean :isadmin
      t.boolean :isbanned

      t.timestamps null: false
    end
  end
end
