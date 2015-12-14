class Image < ActiveRecord::Base
  belongs_to :item

  # validates :item, presence: true
  # validates :file_name, uniqueness: {scope: :item_id}

  mount_uploader :file_name, ImageUploader

end
