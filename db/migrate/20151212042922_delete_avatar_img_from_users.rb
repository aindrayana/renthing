class DeleteAvatarImgFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_img
  end
end
