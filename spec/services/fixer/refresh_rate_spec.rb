# frozen_string_literal: true

require "rails_helper"
require "support/fixer/api_helper"

RSpec.describe Fixer::RefreshRate do
  include Fixer::ApiHelper

  describe "#call" do
    it "returns a domain entity" do
      rate = create_entity
      service = described_class.new(rate: rate)
      response_body = file_fixture("fixer/latest/success.json").read

      stub_latest_request(status: 200, response_body: response_body)
      result = service.call
      entity = build_entity_from(RateValue.last)

      expect(result).to eq(entity)
    end

    it "creates a new rate value" do
      rate = create_entity
      service = described_class.new(rate: rate)
      response_body = file_fixture("fixer/latest/success.json").read

      stub_latest_request(status: 200, response_body: response_body)
      execution = -> { service.call }

      expect(execution).to change(RateValue, :count).from(0).to(1)
    end

    it "creates a new rate value with the expected value" do
      rate = create_entity
      service = described_class.new(rate: rate)
      response_body = file_fixture("fixer/latest/success.json").read

      stub_latest_request(status: 200, response_body: response_body)
      result = service.call

      expect(result.value).to eq(1.21633)
    end

    it "returns nil" do
      rate = create_entity
      service = described_class.new(rate: rate)
      response_body = file_fixture("fixer/latest/error.json").read

      stub_latest_request(status: 500, response_body: response_body)
      result = service.call

      expect(result).to eq(nil)
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
