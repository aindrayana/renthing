class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  # relations -----------------------------------------------------------------
  has_many :reservations, dependent: :destroy
  # has_many :users_reservations, through: :users, source: :reservations

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # geocoding -----------------------------------------------------------------
  geocoded_by :full_street_address
  after_validation :geocode

  # state machine -------------------------------------------------------------
  include AASM
  aasm whiny_transitions: false do
    state :available, initial: true
    state :reserved
    state :approved
    state :cancelled
    state :returned

    event :reserve do
      transitions from: :available, to: :reserved
    end
    event :approve do
      transitions from: :reserved, to: :approved
    end
    event :cancel do
      transitions from: :reserved, to: :cancelled
    end
    event :return do
      transitions from: :approved, to: :returned
    end
  end


  private

  def full_street_address
    "#{address} #{city} #{province} #{postal_code}"
  end

end
