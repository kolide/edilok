class Report < ApplicationRecord
  include AccountOwnable

  validates :name, presence: true
end
