class User < ApplicationRecord
  has_secure_password

  validates :email, email_format: { message: "Invalid email address" }
end
