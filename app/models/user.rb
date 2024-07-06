# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :authentications, dependent: :destroy
end
