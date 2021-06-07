# frozen_string_literal: true

require "rails_helper"

RSpec.describe RateEntity do
  describe "#from" do
    it "returns base symbol" do
      entity = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity.from

      expect(result).to eq("EUR")
    end
  end

  describe "#symbols" do
    it "returns list of symbols" do
      entity = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity.symbols

      expect(result).to eq(%w[EUR USD])
    end
  end

  describe "#to" do
    it "returns conversion symbol" do
      entity = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity.to

      expect(result).to eq("USD")
    end
  end

  describe "#==" do
    it "returns true" do
      entity1 = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )
      entity2 = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity1 == entity2

      expect(result).to eq(true)
    end

    it "returns false" do
      entity1 = described_class.new(
        id: 1,
        name: "EUR-USD",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )
      entity2 = described_class.new(
        id: 2,
        name: "USD-EUR",
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity1 == entity2

      expect(result).to eq(false)
    end
  end
end
