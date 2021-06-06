# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateProjectForm do
  describe "#call" do
    it "creates a project" do
      contract = CreateProjectContract.new
      params = build_params
      form = described_class.new(contract: contract, params: params)

      execution = -> { form.call }

      expect(execution).to change(Project, :count).from(0).to(1)
    end

    it "creates credentials for the project" do
      contract = CreateProjectContract.new
      params = build_params
      form = described_class.new(contract: contract, params: params)

      execution = -> { form.call }

      expect(execution).to change(ProjectCredentials, :count).from(0).to(1)
    end
  end

  describe "#errors" do
    it "returns an empty hash if params are valid" do
      contract = CreateProjectContract.new
      params = build_params
      form = described_class.new(contract: contract, params: params)

      form.call
      result = form.errors

      expect(result).to eq({})
    end

    it "returns a hash with errors if params are invalid" do
      contract = CreateProjectContract.new
      params = build_params(name: "")
      form = described_class.new(contract: contract, params: params)

      form.call
      result = form.errors

      expect(result).to eq(name: ["must be filled"])
    end
  end

  describe "#success?" do
    it "returns true if params are valid" do
      contract = CreateProjectContract.new
      params = build_params
      form = described_class.new(contract: contract, params: params)

      form.call
      result = form.success?

      expect(result).to eq(true)
    end

    it "returns false if params are invalid" do
      contract = CreateProjectContract.new
      params = build_params(name: "")
      form = described_class.new(contract: contract, params: params)

      form.call
      result = form.success?

      expect(result).to eq(false)
    end
  end

  def build_params(overrides = {})
    {
      name: "Project"
    }.merge(overrides)
  end
end
