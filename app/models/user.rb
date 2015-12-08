class User < ActiveRecord::Base
  has_secure_password

# ---------------------------------------------------------------------------- #
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  after_initialize :set_default_values

  private

  def set_default_values
    self.isadmin ||= false
    self.isbanned ||= false
  end

end
