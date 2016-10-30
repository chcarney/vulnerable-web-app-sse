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

  # implement unsecure, custom password setter
  def password=(unencrypted_password)
    if unencrypted_password.nil?
      self.password_digest = nil
    elsif !unencrypted_password.empty?
      self.password_plain = unencrypted_password
      self.password_md5 = Digest::MD5.hexdigest(unencrypted_password)
      @password = unencrypted_password
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      self.password_digest = BCrypt::Password.create(unencrypted_password, cost: cost)
    end
  end
end
