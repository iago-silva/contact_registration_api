# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    zipcode { 'zip_code' }
    number { 'number' }
    street { 'street' }
    neighborhood { 'neighborhood' }
    city { 'city' }
    state { 'state' }
    complement { 'complement' }
    latitude { '3123213123' }
    longitude { '123123123' }
  end
end
