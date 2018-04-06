# frozen_string_literal: true

class Buyer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :sale
end
