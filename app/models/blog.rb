# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :admin
  has_many :images, as: :imageable, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
