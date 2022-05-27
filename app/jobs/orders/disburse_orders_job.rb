# frozen_string_literal: true

module Orders
  class DisburseOrdersJob < ApplicationJob
    queue_as :default

    def perform
      Order.completed.each { |order| create_disbursement!(order) if order.disbursement.nil? }
    end

    def create_disbursement!(order)
      Disbursement.create!(order: order, fee_amount: order.fee_amount)
    end
  end
end
