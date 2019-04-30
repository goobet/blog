# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true

  scope :published, -> { where(published: true) }

  mount_base64_uploader :image, ImageUploader
end
