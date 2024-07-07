# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    zip_code { 'zip_code' }
    number { 'number' }
    street { 'street' }
    neighborhood { 'neighborhood' }
    city { 'city' }
    state { 'state' }
    complement { 'complement' }
  end
end
