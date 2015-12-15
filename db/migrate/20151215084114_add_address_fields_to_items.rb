class AddAddressFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :address, :string
    add_column :items, :city, :string
    add_column :items, :province, :string
    add_column :items, :postal_code, :string
    add_column :items, :longitude, :float
    add_column :items, :latitude, :float
  end
end
