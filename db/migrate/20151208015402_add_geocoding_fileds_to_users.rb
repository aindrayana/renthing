class AddGeocodingFiledsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apt_suite_no, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :postal_code, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
