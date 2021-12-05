class User < ApplicationRecord
  has_secure_password
  belongs_to :account

  validates :name, presence: true
end
