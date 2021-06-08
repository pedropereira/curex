# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create project", type: :request do
  include ActiveSupport::Testing::TimeHelpers

  it "responds with 200 status code" do
    params = { project: { name: "Project" } }

    post(api_v1_projects_path, params: params)

    expect(response).to have_http_status(:ok)
  end

  it "responds with 400 status code" do
    params = { project: { name: "" } }

    post(api_v1_projects_path, params: params)

    expect(response).to have_http_status(:bad_request)
  end

  it "returns serialized response" do
    params = { project: { name: "Project" } }

    travel_to("2020-10-31T01:30:00Z") do
      post(api_v1_projects_path, params: params)
    end
    result = JSON.parse(response.body)
    project_credentials = ProjectCredentials.last

    expect(result).to eq(
      "project" => {
        "name" => "Project",
        "created_at" => "2020-10-31T01:30:00Z",
        "updated_at" => "2020-10-31T01:30:00Z",
        "credentials" => {
          "api_key" => project_credentials.api_key,
          "created_at" => "2020-10-31T01:30:00Z",
          "updated_at" => "2020-10-31T01:30:00Z"
        }
      }
    )
  end
end
