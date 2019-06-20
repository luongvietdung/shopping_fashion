# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :admin
  has_many :order_items
  has_many :images, as: :imageable

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  accepts_nested_attributes_for :images
end
