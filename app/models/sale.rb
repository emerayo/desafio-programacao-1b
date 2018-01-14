class Sale < ApplicationRecord
  validates :address, :buyer, :description, :provider, :quantity, presence: true
  validates :price, :quantity, numericality: true
end
