# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :admin
  has_many :images

  validates :content, precences: true
end
