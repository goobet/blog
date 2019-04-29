# frozen_string_literal: true

class AddAuthorToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :author, index: true
  end
end
