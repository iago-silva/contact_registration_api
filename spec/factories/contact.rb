# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'name' }
    cpf { CPF.generate }
    phone { 'phone' }

    association :address, strategy: :build
  end
end
