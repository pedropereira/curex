# frozen_string_literal: true

require "rails_helper"

RSpec.describe RefreshRateCommand do
  describe "#call" do
    it "returns a domain entity" do
      rate = create_entity
      service = described_class.new(rate: rate, value: 1.2345)

      result = service.call
      entity = build_entity_from(RateValue.last)

      expect(result).to eq(entity)
    end

    it "creates a new rate value" do
      rate = create_entity
      service = described_class.new(rate: rate, value: 1.2345)

      execution = -> { service.call }

      expect(execution).to change(RateValue, :count).from(0).to(1)
    end

    it "creates a new rate value with the expected value" do
      rate = create_entity
      service = described_class.new(rate: rate, value: 1.2345)

      result = service.call

      expect(result.value).to eq(1.2345)
    end
  end

  def create_entity
    model = FactoryBot.create(:rate)

    RateMapper.to_domain(model)
  end

  def build_entity_from(model)
    RateValueMapper.to_domain(model)
  end
end
