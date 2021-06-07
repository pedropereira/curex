# frozen_string_literal: true

require "rails_helper"

RSpec.describe LatestRateValueQuery do
  describe "#call" do
    it "returns a domain entity" do
      rate1 = FactoryBot.create(:rate, name: "EUR-USD")
      rate2 = FactoryBot.create(:rate, name: "USD-EUR")
      _rate_value1 = FactoryBot.create(:rate_value, rate_id: rate2.id)
      _rate_value2 = FactoryBot.create(:rate_value, rate_id: rate2.id)
      _rate_value3 = FactoryBot.create(:rate_value, rate_id: rate1.id)
      rate_value4 = FactoryBot.create(:rate_value, rate_id: rate1.id)
      entity = build_entity_from(rate_value4)
      query = described_class.new(rate: rate1)

      result = query.call

      expect(result).to eq(entity)
    end

    it "returns nil" do
      rate = FactoryBot.create(:rate)
      query = described_class.new(rate: rate)

      result = query.call

      expect(result).to eq(nil)
    end
  end

  def build_entity_from(model)
    RateValueMapper.to_domain(model)
  end
end
