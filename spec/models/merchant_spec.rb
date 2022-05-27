# frozen_string_literal: true

# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  cif        :string
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
RSpec.describe Merchant, type: :model do
  subject { build(:merchant) }

  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:shoppers).through(:orders) }
end
