# frozen_string_literal: true

# == Schema Information
#
# Table name: disbursements
#
#  id                  :bigint           not null, primary key
#  fee_amount_cents    :integer          default(0), not null
#  fee_amount_currency :string           default("EUR"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  order_id            :bigint           not null
#
# Indexes
#
#  index_disbursements_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
class Disbursement < ApplicationRecord
  belongs_to :order
  has_one :merchant, through: :order

  monetize :fee_amount_cents, allow_nil: false

  validates :order, presence: true
end
