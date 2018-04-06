class Sale < ApplicationRecord
  validates :description, :quantity, presence: true
  validates :price, :quantity, numericality: true

  belongs_to :buyer
  belongs_to :provider
end
