# frozen_string_literal: true

require "rails_helper"

RSpec.describe RateMapper do
  describe "::to_domain" do
    it "returns the domain entity" do
      mapper = described_class
      model = FactoryBot.build_stubbed(:rate)
      entity = RateEntity.new(
        id: model.id,
        name: model.name,
        created_at: model.created_at,
        updated_at: model.updated_at
      )

      result = mapper.to_domain(model)

      expect(result).to eq(entity)
    end
  end
end
