# frozen_string_literal: true

require "rails_helper"

RSpec.describe RateSerializer do
  describe "#call" do
    it "returns a hash with a serialized rate and value" do
      rate = FactoryBot.create(:rate)
      rate_value = FactoryBot.create(:rate_value, rate_id: rate.id)
      serializer = described_class.new(rate: rate)

      result = serializer.call

      expect(result).to eq(
        rate.name.to_sym => {
          value: rate_value.value,
          updated_at: rate_value.updated_at.iso8601
        }
      )
    end

    it "returns a hash with a serialized rate and without value" do
      rate = FactoryBot.build_stubbed(:rate)
      serializer = described_class.new(rate: rate)

      result = serializer.call

      expect(result).to eq(
        rate.name.to_sym => {}
      )
    end

    it "returns an empty hash if it receives nil" do
      serializer = described_class.new(rate: nil)

      result = serializer.call

      expect(result).to eq({})
    end
  end
end
