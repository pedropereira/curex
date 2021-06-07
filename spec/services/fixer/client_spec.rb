# frozen_string_literal: true

require "rails_helper"

RSpec.describe Fixer::Client do
  it "contains ACCESS_KEY" do
    result = described_class::ACCESS_KEY

    expect(result).to eq("241b5b6541b6e441a0b1d146bd14513b")
  end

  it "contains BASE_URL" do
    result = described_class::BASE_URL

    expect(result).to eq("http://data.fixer.io")
  end

  describe "#connection" do
    it "returns a Faraday connection" do
      service = described_class.new

      result = service.connection

      expect(result).to be_an_instance_of(Faraday::Connection)
    end
  end
end
