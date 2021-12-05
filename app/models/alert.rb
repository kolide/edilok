class Alert < ApplicationRecord
  include AccountOwnable
  belongs_to :device

  validates :name, presence: true
end
