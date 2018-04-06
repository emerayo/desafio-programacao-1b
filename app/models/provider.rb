class Provider < ApplicationRecord
  validates :address, :name, presence: true
  validates :address, :name, uniqueness: true

  has_many :sale
end
