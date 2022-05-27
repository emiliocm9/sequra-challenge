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
class Shopper < ApplicationRecord
  has_many :orders
  has_many :merchants, through: :orders
end
