# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectCredentialsQuery do
  describe "#call" do
    it "returns the latest project credentials" do
      project1 = FactoryBot.create(:project, name: "Project1")
      project2 = FactoryBot.create(:project, name: "Project2")
      _project_credentials1 = FactoryBot.create(:project_credentials, project_id: project1.id)
      _project_credentials2 = FactoryBot.create(:project_credentials, project_id: project1.id)
      project_credentials3 = FactoryBot.create(:project_credentials, project_id: project1.id)
      _project_credentials4 = FactoryBot.create(:project_credentials, project_id: project2.id)
      query = described_class.new(project: project1)

      result = query.call

      expect(result).to eq(project_credentials3)
    end

    it "returns nil" do
      project = FactoryBot.create(:project)
      query = described_class.new(project: project)

      result = query.call

      expect(result).to eq(nil)
    end
  end
end
