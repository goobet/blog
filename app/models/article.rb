# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :content, presence: true
end
