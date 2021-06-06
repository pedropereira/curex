# frozen_string_literal: true

class CreateProjectCommand
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def call
    ActiveRecord::Base.transaction do
      project = Project.create!(name: name)
      ProjectCredentials.create!(api_key: build_api_key, project_id: project.id)

      project
    end
  end

  private

  def build_api_key
    SecureRandom.hex(32)
  end
end
