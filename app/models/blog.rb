# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :admin
  has_many :images, as: :imageable

  validates :content, presence: true
end
