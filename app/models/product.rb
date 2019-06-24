# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  belongs_to :admin
  has_many :order_items
  has_many :images, as: :imageable
  friendly_id :slug_candidates, use: %i[slugged finders]

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  accepts_nested_attributes_for :images

  after_create :remake_slug
  def slug_candidates
    [
      name,
      [name, :id]
    ]
  end

  def remake_slug
    update_attribute(:slug, nil)
    save!
  end
end
