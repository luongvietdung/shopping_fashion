# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
