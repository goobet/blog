# frozen_string_literal: true

class AddImageToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image, :string
  end
end
