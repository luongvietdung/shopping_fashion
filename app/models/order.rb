# frozen_string_literal: true

class Order < ApplicationRecord
  before_create :set_order_status
  before_save :update_subtotal
  
  enum status: %i[padding complete]
  belongs_to :user

  has_many :order_items, dependent: :destroy

  validates :address, presence: true, length: { maximum: 150 }
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :full_name, presence: true, length: { maximum: 50 }

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.product.price) : 0 }.sum
  end
  
  private
  def set_order_status
    self.status = 0
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
