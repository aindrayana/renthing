class User < ActiveRecord::Base
  has_secure_password

  has_many :items, dependent: :nullify

# ---------------------------------------------------------------------------- #
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  after_initialize :set_default_values

  mount_uploader :avatars, ImageUploader

  private

  def set_default_values
    self.isadmin ||= false
    self.isbanned ||= false
  end

end
