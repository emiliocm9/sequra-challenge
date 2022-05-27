# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("EUR"), not null
#  completed_at    :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  merchant_id     :bigint           not null
#  shopper_id      :bigint           not null
#
# Indexes
#
#  index_orders_on_merchant_id  (merchant_id)
#  index_orders_on_shopper_id   (shopper_id)
#
# Foreign Keys
#
#  fk_rails_...  (merchant_id => merchants.id)
#  fk_rails_...  (shopper_id => shoppers.id)
#
FactoryBot.define do
  factory :order do
    amount_cents { rand(1_00..100_00) }
    amount_currency { "EUR" }
    merchant
    shopper

    trait :completed do
      completed_at { Time.current }
    end
  end
end
