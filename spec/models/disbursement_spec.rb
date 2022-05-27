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
RSpec.describe Disbursement, type: :model do
  subject { build(:disbursement, fee_amount_cents: fee_amount_cents) }

  let(:fee_amount_cents) { rand(1_00..100_00) }

  it { is_expected.to monetize(:fee_amount_cents) }

  it { is_expected.to validate_presence_of(:order) }
end
