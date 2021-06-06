# frozen_string_literal: true

class ProjectSerializer
  attr_reader :project

  def initialize(project:)
    @project = project
  end

  def call
    return {} if project.blank?

    {
      project: {
        name: project.name,
        created_at: project.created_at.iso8601,
        updated_at: project.updated_at.iso8601
      }.merge(project_credentials)
    }
  end

  private

  def project_credentials
    project_credentials = ProjectCredentialsQuery.new(project: project).call

    ProjectCredentialsSerializer.new(project_credentials: project_credentials).call
  end
end
