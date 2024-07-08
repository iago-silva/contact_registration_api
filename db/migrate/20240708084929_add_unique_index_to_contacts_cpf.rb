# frozen_string_literal: true

class AddUniqueIndexToContactsCpf < ActiveRecord::Migration[7.0]
  def change
    add_index :contacts, [:cpf, :user_id], unique: true
  end
end
