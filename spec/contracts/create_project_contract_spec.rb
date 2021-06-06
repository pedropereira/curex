# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateProjectContract do
  describe "#errors" do
    it "returns all missing errors" do
      params = {}
      contract = described_class.new

      result = contract.call(params).errors.to_h

      expect(result).to eq(
        name: ["is missing"]
      )
    end

    it "returns name must be a string error" do
      params = { name: 1 }
      contract = described_class.new

      result = contract.call(params).errors.to_h

      expect(result).to eq(
        name: ["must be a string"]
      )
    end

    it "returns empty hash if validation succeeded" do
      params = { name: "Project" }
      contract = described_class.new

      result = contract.call(params).errors.to_h

      expect(result).to eq({})
    end
  end

  describe "#call" do
    it "returns an empty hash if validation failed" do
      params = {}
      contract = described_class.new

      result = contract.call(params).to_h

      expect(result).to eq({})
    end

    it "returns valid params if validation succeeded" do
      params = { name: "Project" }
      contract = described_class.new

      result = contract.call(params).to_h

      expect(result).to eq(
        name: "Project"
      )
    end
  end
end
