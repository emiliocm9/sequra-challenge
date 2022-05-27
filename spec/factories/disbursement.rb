# frozen_string_literal: true

FactoryBot.define do
  factory :disbursement do
    order
    fee_amount_cents { rand(1_00..100_00) }
    fee_amount_currency { "EUR" }
  end
end
