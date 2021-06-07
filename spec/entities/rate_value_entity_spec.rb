# frozen_string_literal: true

require "rails_helper"

RSpec.describe RateValueEntity do
  describe "#==" do
    it "returns true" do
      entity1 = described_class.new(
        id: 1,
        value: 1.2345,
        rate_id: 2,
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )
      entity2 = described_class.new(
        id: 1,
        value: 1.2345,
        rate_id: 2,
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity1 == entity2

      expect(result).to eq(true)
    end

    it "returns false" do
      entity1 = described_class.new(
        id: 1,
        value: 1.2345,
        rate_id: 2,
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )
      entity2 = described_class.new(
        id: 2,
        value: 5.6789,
        rate_id: 3,
        created_at: "2020-10-31T01:30:00Z",
        updated_at: "2020-10-31T01:30:00Z"
      )

      result = entity1 == entity2

      expect(result).to eq(false)
    end
  end
end
