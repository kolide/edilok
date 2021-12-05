class Account < ApplicationRecord
  has_many :alerts, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true
end
