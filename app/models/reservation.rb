class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  include AASM

  aasm whiny_transitions: false do
    state :pending, initial: true
    state :approved
    state :returned
    state :cancelled

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :return do
      transitions from: :approved, to: :returned
    end

    event :cancel do
      transitions from: :pending, to: :cancelled
    end
  end

end
