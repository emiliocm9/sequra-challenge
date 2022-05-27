# frozen_string_literal: true

require "clockwork/test"

describe Clockwork do # rubocop:disable RSpec/FilePath
  subject(:clockwork) { Clockwork::Test }

  let(:clock_file) { "lib/clock.rb" }
  let(:tick_speed) { 1.hour }
  let(:max_ticks) { 1 }

  before do
    Clockwork::Test.run(
      file: clock_file,
      start_time: try(:start_time),
      end_time: try(:end_time),
      tick_speed: tick_speed,
      max_ticks: max_ticks,
    )
  end

  after do
    Clockwork::Test.clear!
  end

  # You can test clockworks separately in your console
  # Clockwork.manager.handler { |job| puts "Running #{job}" }
  # Clockwork.manager.every(1.minute, "minute.job", tz: "Europe/Madrid") { puts "Running every minute" }
  # Clockwork.manager.run

  describe "disburse_orders.job" do
    let(:start_time) { Time.zone.now.next_occurring(:monday) }
    let(:end_time) { start_time + 1.day }
    let(:job_identifier) { "disburse_orders.job" }

    it "runs every monday at 00:00" do
      expect(clockwork).to have_run(job_identifier).once
    end

    context "when it is not the scheduled time" do
      let(:start_time) { Time.zone.now.next_occurring(:friday) }

      it "does not run" do
        expect(clockwork).not_to have_run(job_identifier)
      end
    end
  end
end
