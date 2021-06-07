# frozen_string_literal: true

require "rails_helper"

RSpec.describe FindRateQuery do
  describe "#call" do
    it "returns rate" do
      model = FactoryBot.create(:rate)
      entity = build_entity_from(model)
      query = described_class.new(name: entity.name)

      result = query.call

      expect(result).to eq(entity)
    end

    it "raises ActiveRecord::RecordNotFound" do
      query = described_class.new(name: "invalid")

      execution = -> { query.call }

      expect(execution).to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  def build_entity_from(model)
    RateMapper.to_domain(model)
  end
end
