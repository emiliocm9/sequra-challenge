# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# load seed data from fixtures/merchants.csv for Merchant model
#
CSV.foreach('fixtures/merchants.csv') do |row|
  Merchant.create(
    name: row[1],
    email: row[2],
    cif: row[3]
  )
end

# load seed data from fixtures/shoppers.csv for Shopper model
#
CSV.foreach('fixtures/shoppers.csv') do |row|
  Shopper.create(
    name: row[1],
    email: row[2],
    nif: row[3]
  )
end

# load seed data from fixtures/orders.csv for Order model
#
CSV.foreach('fixtures/orders.csv') do |row|
  order = Order.new(
    amount: Money.new((row[3].to_f * 100).round),
    created_at: row[4],
    completed_at: row[5],
  )
  order.merchant = Merchant.find(row[1])
  order.shopper = Shopper.find(row[2])
  order.save
end

