class Transaction < ApplicationRecord
  belongs_to :invoice

  has_many :merchants, through: :items
  scope :successful, -> { where(result: 'success') }
  default_scope { order("id asc") }
end
