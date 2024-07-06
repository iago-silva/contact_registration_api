# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy

  validates :address, presence: true
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: { scope: :user }
  validates :phone, presence: true

  validate :valid_cpf, on: [:create, :update]

  accepts_nested_attributes_for :address, update_only: true

  private

  def valid_cpf
    return if CPF.valid?(cpf)

    errors.add(:cpf, :invalid)
  end
end
