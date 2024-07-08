# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :contacts, dependent: :destroy
end
