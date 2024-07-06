class Contact < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy

  validates :address, presence: true

  accepts_nested_attributes_for :address, update_only: true
end
