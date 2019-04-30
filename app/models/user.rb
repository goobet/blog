# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :articles, foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: { user: 0, admin: 1 }
end
