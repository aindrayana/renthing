class ChangeAvatarsFormatInUser < ActiveRecord::Migration
  def change
    change_column :users, :avatars, :string
  end
end
