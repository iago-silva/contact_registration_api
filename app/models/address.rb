# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :contact

  validates :zipcode, presence: true
  validates :number, presence: true
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
