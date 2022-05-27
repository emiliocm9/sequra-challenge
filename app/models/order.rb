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
class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement, dependent: :destroy

  monetize :amount_cents, allow_nil: false

  validates :merchant, presence: true
  validates :shopper, presence: true

  scope :completed, -> { where.not(completed_at: nil) }

  def fee_amount
    disbursement&.fee_amount || Money.new(calculate_fee_amount_cents)
  end

  private

  def calculate_fee_amount_cents
    return (0.001 * amount.to_f).round(2) * 100 if amount_cents < 50_00
    return (0.0095 * amount.to_f).round(2) * 100 if amount_cents < 300_00

    (0.0085 * amount.to_f).round(2) * 100
  end
end
