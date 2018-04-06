# frozen_string_literal: true

class Sale < ApplicationRecord
  validates :description, :quantity, presence: true
  validates :price, :quantity, numericality: true

  belongs_to :buyer
  belongs_to :provider

  delegate :name, to: :buyer, prefix: true
  delegate :address, to: :provider, prefix: true
  delegate :name, to: :provider, prefix: true
end
