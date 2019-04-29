# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, :content, presence: true
end
