# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :article, index: true
      t.references :user, index: true
      t.string :text

      t.timestamps
    end
  end
end
