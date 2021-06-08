# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show rate", type: :request do
  it "responds with 200 status code" do
    project = FactoryBot.create(:project)
    project_credentials = FactoryBot.create(:project_credentials, project_id: project.id)
    FactoryBot.create(:rate, name: "EUR-USD")
    params = { rate: { name: "EUR-USD" }, api_key: project_credentials.api_key }

    get(rate_path, params: params)

    expect(response).to have_http_status(:ok)
  end

  it "responds with 404 status code" do
    project = FactoryBot.create(:project)
    project_credentials = FactoryBot.create(:project_credentials, project_id: project.id)
    params = { rate: { name: "invalid" }, api_key: project_credentials.api_key }

    get(rate_path, params: params)

    expect(response).to have_http_status(:not_found)
  end

  it "responds with 401 status code if api_key is not sent" do
    FactoryBot.create(:rate, name: "EUR-USD")
    params = { rate: { name: "EUR-USD" } }

    get(rate_path, params: params)

    expect(response).to have_http_status(:unauthorized)
  end

  it "responds with 401 status code if api_key is invalid" do
    FactoryBot.create(:rate, name: "EUR-USD")
    params = { rate: { name: "EUR-USD" }, api_key: "invalid" }

    get(rate_path, params: params)

    expect(response).to have_http_status(:unauthorized)
  end

  it "returns serialized response" do
    time = "2020-10-31T01:30:00Z"
    project = FactoryBot.create(:project)
    project_credentials = FactoryBot.create(:project_credentials, project_id: project.id)
    rate = FactoryBot.create(:rate, name: "EUR-USD")
    FactoryBot.create(:rate_value, value: 1.2345, rate_id: rate.id, created_at: time, updated_at: time)
    params = { rate: { name: "EUR-USD" }, api_key: project_credentials.api_key }

    get(rate_path, params: params)
    result = JSON.parse(response.body)

    expect(result).to eq(
      "EUR-USD" => {
        "updated_at" => "2020-10-31T01:30:00Z",
        "value" => 1.2345
      }
    )
  end
end
