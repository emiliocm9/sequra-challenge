# frozen_string_literal: true

# == Schema Information
#
# Table name: shoppers
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  nif        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Shopper, type: :model do
  subject { build(:shopper) }

  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:merchants).through(:orders) }
end
