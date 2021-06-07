# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Show rate", type: :request do
  it "responds with 200 status code" do
    FactoryBot.create(:rate, name: "EUR-USD")
    params = { rate: { name: "EUR-USD" } }

    get(rate_path, params: params)

    expect(response).to have_http_status(:ok)
  end

  it "responds with 404 status code" do
    params = { rate: { name: "invalid" } }

    get(rate_path, params: params)

    expect(response).to have_http_status(:not_found)
  end

  it "returns serialized response" do
    time = "2020-10-31T01:30:00Z"
    rate = FactoryBot.create(:rate, name: "EUR-USD")
    FactoryBot.create(:rate_value, value: 1.2345, rate_id: rate.id, created_at: time, updated_at: time)
    params = { rate: { name: "EUR-USD" } }

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
