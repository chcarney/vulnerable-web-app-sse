class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def confirm!
    update!(confirmed_at: DateTime.now)
  end

  def confirmed?
    !! confirmed_at
  end
end
