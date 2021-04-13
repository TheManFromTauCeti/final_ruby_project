class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :password_digest, presence: true
  has_secure_password
  has_secure_password :recovery_password, validations: false
end
