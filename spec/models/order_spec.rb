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
RSpec.describe Order, type: :model do
  subject { build(:order, amount_cents: amount_cents) }

  let(:amount_cents) { rand(1_00..100_00) }

  it { is_expected.to belong_to(:merchant) }
  it { is_expected.to belong_to(:shopper) }
  it { is_expected.to have_one(:disbursement).dependent(:destroy) }


  it { is_expected.to monetize(:amount_cents) }

  it { is_expected.to validate_presence_of(:merchant) }
  it { is_expected.to validate_presence_of(:shopper) }

  describe "fee_amount" do
    subject { order.fee_amount }

    let(:order) { create(:order, amount_cents: amount_cents) }

    context "when disbursement is present" do
      let!(:disbursement) { create(:disbursement, order: order) }

      it { is_expected.to eq(disbursement.fee_amount) }
    end

    context "when disbursement is not present" do
      context "when amount is less than 50 EUR" do
        let(:amount_cents) { 10_00 }
        let(:fee_amount_cents) { (0.001 * amount_cents).round(2) * 100 }
        let(:expected_fee_amount) { Money.new(fee_amount_cents) }

        it { is_expected.to eq(expected_fee_amount) }
      end

      context "when amount is less than 300 EUR and greater than 50 EUR" do
        let(:amount_cents) { 200_00 }
        let(:fee_amount_cents) { (0.0095 * amount_cents).round(2) * 100 }
        let(:expected_fee_amount) { Money.new(fee_amount_cents) }

        it { is_expected.to eq(expected_fee_amount) }
      end

      context "when amount is greater than 300 EUR" do
        let(:amount_cents) { 300_00 }
        let(:fee_amount_cents) { (0.0085 * amount_cents).round(2) * 100 }
        let(:expected_fee_amount) { Money.new(fee_amount_cents) }

        it { is_expected.to eq(expected_fee_amount) }
      end
    end
  end
end
