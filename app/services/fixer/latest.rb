# frozen_string_literal: true

class Fixer::Latest
  def call(symbols:)
    params = { access_key: access_key, symbols: symbols, format: 1 }
    response = client.connection.get("api/latest", params)

    if response.success?
      JSON.parse(response.body)
    else
      {}
    end
  end

  private

  def access_key
    client.class::ACCESS_KEY
  end

  def client
    @client ||= Fixer::Client.new
  end
end
