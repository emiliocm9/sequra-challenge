# frozen_string_literal: true

require "./config/boot"
require "./config/environment"

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.day, "disburse_orders.job", tz: "Europe/Madrid", if: ->(t) { t.monday? }) do
    Orders::DisburseOrdersJob.perform_later
  end
end
