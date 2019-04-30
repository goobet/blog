# frozen_string_literal: true

class AddPublishedToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :published, :boolean, null: false, default: false
  end
end
