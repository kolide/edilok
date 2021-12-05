class Device < ApplicationRecord
  include AccountOwnable
  has_many :alerts, dependent: :destroy

  validates :name, presence: true
end
