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
FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
    cif { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
  end
end
