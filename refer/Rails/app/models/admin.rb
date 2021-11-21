class Admin < ApplicationRecord
  has_secure_password
  #has_many :applications
  validates :email_address, presence: true, uniqueness: true
end
