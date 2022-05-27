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
class Merchant < ApplicationRecord
  has_many :orders
  has_many :shoppers, through: :orders
  has_many :disbursements, through: :orders
end
