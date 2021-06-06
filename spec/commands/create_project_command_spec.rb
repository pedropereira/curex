# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateProjectCommand do
  describe "#call" do
    it "creates a project" do
      command = described_class.new(name: "Project")

      execution = -> { command.call }

      expect(execution).to change(Project, :count).from(0).to(1)
    end

    it "creates credentials for the project" do
      command = described_class.new(name: "Project")

      execution = -> { command.call }

      expect(execution).to change(ProjectCredentials, :count).from(0).to(1)
    end

    it "returns a project" do
      command = described_class.new(name: "Project")

      result = command.call
      expected_project = Project.first

      expect(result).to eq(expected_project)
    end

    # rubocop:disable RSpec/MultipleExpectations
    it "does not create a project if there is an error when creating its credentials" do
      allow(ProjectCredentials).to receive(:create!).and_raise(StandardError)
      command = described_class.new(name: "Project")

      execution = -> { command.call }

      expect(execution).to raise_error do |_error|
        result = Project.count

        expect(result).to eq(0)
      end
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
