# frozen_string_literal: true

class ProjectCredentialsSerializer
  attr_reader :project_credentials

  def initialize(project_credentials:)
    @project_credentials = project_credentials
  end

  def call
    return {} if project_credentials.blank?

    {
      credentials: {
        api_key: project_credentials.api_key,
        created_at: project_credentials.created_at.iso8601,
        updated_at: project_credentials.updated_at.iso8601
      }
    }
  end
end
