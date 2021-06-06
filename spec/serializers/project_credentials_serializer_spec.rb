# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectCredentialsSerializer do
  describe "#call" do
    it "returns a hash with serialized project credentials" do
      project_credentials = FactoryBot.create(:project_credentials)
      serializer = described_class.new(project_credentials: project_credentials)

      result = serializer.call

      expect(result).to eq(
        credentials: {
          api_key: project_credentials.api_key,
          created_at: project_credentials.created_at.iso8601,
          updated_at: project_credentials.updated_at.iso8601
        }
      )
    end

    it "returns an empty hash if it receives nil" do
      serializer = described_class.new(project_credentials: nil)

      result = serializer.call

      expect(result).to eq({})
    end
  end
end
