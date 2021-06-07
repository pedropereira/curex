# frozen_string_literal: true

require "rails_helper"
require "support/fixer/api_helper"

RSpec.describe Fixer::Latest do
  include Fixer::ApiHelper

  describe "#call" do
    it "returns the latest rate" do
      service = described_class.new
      response_body = file_fixture("fixer/latest/success.json").read

      stub_latest_request(status: 200, response_body: response_body)
      result = service.call(symbols: "EUR,USD")

      expect(result).to eq(
        "base" => "EUR",
        "date" => "2021-06-07",
        "rates" => {
          "EUR" => 1,
          "USD" => 1.21633
        },
        "success" => true,
        "timestamp" => 1_623_010_457
      )
    end

    it "returns an empty hash" do
      service = described_class.new
      response_body = file_fixture("fixer/latest/error.json").read

      stub_latest_request(status: 500, response_body: response_body)
      result = service.call(symbols: "EUR,USD")

      expect(result).to eq({})
    end
  end
end
