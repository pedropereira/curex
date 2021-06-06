# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectSerializer do
  describe "#call" do
    it "returns a hash with a serialized project and credentials" do
      project = FactoryBot.create(:project)
      project_credentials = FactoryBot.create(:project_credentials, project_id: project.id)
      serializer = described_class.new(project: project)

      result = serializer.call

      expect(result).to eq(
        project: {
          name: project.name,
          created_at: project.created_at.iso8601,
          updated_at: project.updated_at.iso8601,
          credentials: {
            api_key: project_credentials.api_key,
            created_at: project_credentials.created_at.iso8601,
            updated_at: project_credentials.updated_at.iso8601
          }
        }
      )
    end

    it "returns a hash with a serialized project and without credentials" do
      project = FactoryBot.build_stubbed(:project)
      serializer = described_class.new(project: project)

      result = serializer.call

      expect(result).to eq(
        project: {
          name: project.name,
          created_at: project.created_at.iso8601,
          updated_at: project.updated_at.iso8601
        }
      )
    end

    it "returns an empty hash if it receives nil" do
      serializer = described_class.new(project: nil)

      result = serializer.call

      expect(result).to eq({})
    end
  end
end
