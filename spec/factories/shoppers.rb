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
FactoryBot.define do
  factory :shopper do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    nif { Faker::Number.number(digits: 10) }
  end
end
