class User < ActiveRecord::Base
  has_secure_password

  has_many :items, dependent: :nullify

  has_many :reservations, dependent: :nullify
  has_many :items_reservations, through: :items, source: :reservations

# ---------------------------------------------------------------------------- #
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  geocoded_by :full_street_address
  after_validation :geocode

  after_initialize :set_default_values

  mount_uploader :avatars, ImageUploader

  private

  def full_street_address
    "#{address} #{city} #{province} #{postal_code}"
  end

  def set_default_values
    self.isadmin ||= false
    self.isbanned ||= false
  end

end
