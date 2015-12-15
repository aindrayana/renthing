class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  geocoded_by :full_street_address
  after_validation :geocode

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  private

  def full_street_address
    "#{address} #{city} #{province} #{postal_code}"
  end

end
