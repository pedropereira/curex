# frozen_string_literal: true

class ProjectCredentialsQuery
  attr_reader :project

  def initialize(project:)
    @project = project
  end

  def call
    ProjectCredentials.where(project_id: project.id).order(created_at: :desc).first
  end
end
