# frozen_string_literal: true

require "rails_helper"

RSpec.describe RateValueSerializer do
  describe "#call" do
    it "returns a hash with serialized project credentials" do
      rate_value = FactoryBot.create(:rate_value)
      serializer = described_class.new(rate_value: rate_value)

      result = serializer.call

      expect(result).to eq(
        value: 1.21633,
        updated_at: rate_value.updated_at.iso8601
      )
    end

    it "returns an empty hash if it receives nil" do
      serializer = described_class.new(rate_value: nil)

      result = serializer.call

      expect(result).to eq({})
    end
  end
end
